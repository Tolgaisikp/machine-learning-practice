import pygame
import random
from enum import Enum
from collections import namedtuple
import numpy as np

pygame.init()
font = pygame.font.Font('arial.ttf', 25)

# reset
# reward
# play(action) -> direction
# game_iteration
# is_collision

class Direction(Enum):
    RIGHT= 1
    LEFT = 2
    UP = 3
    DOWN = 4

Point = namedtuple('Point','x, y') #ilk argüman ismi ikinci argüman ise değişkenleridir

WHITE = (255,255,255)
RED = (255,255,255)
BLUE = (255, 255, 0)
LIGHT_BLUE = (50,50,50)
BLACK = (0,0,0)

BLOCK_SIZE = 20

#reset, is_collosion ve play_step başka yerlerde kullanılacak

class SnakeGameAI():
    def __init__(self, w = 640, h = 480):
        self.SPEED = 20
        self.w = w
        self.h = h
        #init display
        self.display = pygame.display.set_mode((self.w, self.h)) #display boyutu ayarlama
        pygame.display.set_caption('Snake') # Başlık
        self.clock = pygame.time.Clock() # zamanı alma
        self.reset()

    def reset(self):
        # init game state
        self.direction = Direction.RIGHT  # yönünü belirtiyoruz

        self.head = Point(self.w / 2, self.h / 2)
        self.snake = [self.head,
                      Point(self.head.x - BLOCK_SIZE, self.head.y),
                      Point(self.head.x - (2 * BLOCK_SIZE), self.head.y)]
        self.score = 0
        self.food = None
        self._place_food()
        self.frame_iteration = 0

    def _place_food(self):
        #ekranın random bir yerinde positon elde ederiz
        x = random.randint(0, (self.w-BLOCK_SIZE)//BLOCK_SIZE)*BLOCK_SIZE# blockların köşe başlarından saydığımızdan ilk çıkarıyoruz
        y = random.randint(0, (self.h-BLOCK_SIZE)//BLOCK_SIZE)*BLOCK_SIZE# bölme amacı ise kaçıncı block olduğunu anlamak(int olarak)
        self.food = Point(x,y)
        if self.food in self.snake:
            self._place_food()

    def _ui_update(self):
        self.display.fill(BLACK)

        for pt in self.snake:
            pygame.draw.rect(self.display, BLUE, pygame.Rect(pt.x, pt.y, BLOCK_SIZE, BLOCK_SIZE))
            pygame.draw.rect(self.display, LIGHT_BLUE, pygame.Rect(pt.x+4, pt.y+4, 12, 12))

        pygame.draw.rect(self.display, RED, pygame.Rect(self.food.x, self.food.y, BLOCK_SIZE, BLOCK_SIZE))

        text = font.render('Score: ' + str(self.score), True, WHITE)
        self.display.blit(text, [0,0])
        pygame.display.flip()#bu olmadan değişiklikleri göremeyiz

    def _move(self, action):#private function

        #hangi yöne gideceğimizi buluyoruz
        clock_wise = [Direction.RIGHT, Direction.DOWN, Direction.LEFT, Direction.UP]
        idx = clock_wise.index(self.direction)

        if np.array_equal(action, [1, 0, 0]):
            new_dir = clock_wise[idx] #no change

        elif np.array_equal(action, [0, 1, 0]):
            new_idx = (idx+1)%4
            new_dir = clock_wise[new_idx] #right
        else:
            new_idx = (idx - 1) % 4
            new_dir = clock_wise[new_idx] #left

        self.direction = new_dir

        #bulunan yol ile yılanı hareket ettiriyoruz
        x = self.head.x
        y = self.head.y
        if self.direction == Direction.RIGHT:#önceden self olmama nedeni _move içerisine kullanıcı girişi alınıp direction belirlenirken şimdi makine kendi alıcak
            x += BLOCK_SIZE
        elif self.direction == Direction.LEFT:
            x -= BLOCK_SIZE
        elif self.direction == Direction.UP:
            y -= BLOCK_SIZE
        elif self.direction == Direction.DOWN:
            y += BLOCK_SIZE

        self.head = Point(x,y)

    def is_collision(self, pt = None):
        if pt is None:
            pt = self.head
        #hits boundary (kenarlara)
        if pt.x > self.w - BLOCK_SIZE or pt.x < 0 or pt.y > self.h - BLOCK_SIZE or pt.y < 0:
            return True
        #hits itself (kendine)
        if pt in self.snake[1:]:
            return True

        return False

    def play_step(self, action):
        self.frame_iteration += 1
        #1 collect user input
        for event in pygame.event.get():#tüm kullanıcı eventlerini alır
            if event.type == pygame.QUIT:
                pygame.quit
                quit()
            '''if event.type == pygame.KEYDOWN:#bir tuşa basıldı mı (kullanıcı girdisi olmucağından)
                if event.key == pygame.K_LEFT:
                    self.direction = Direction.LEFT
                elif event.key == pygame.K_RIGHT:
                    self.direction = Direction.RIGHT
                elif event.key == pygame.K_UP:
                    self.direction = Direction.UP
                elif event.key == pygame.K_DOWN:
                    self.direction = Direction.DOWN'''

        #2 move
        self._move(action)#update the head
        self.snake.insert(0, self.head)

        #3 check if game over
        reward = 0
        game_over = False
        if self.is_collision() or self.frame_iteration > 100*len(self.snake):
            game_over = True
            reward = -10
            return reward, game_over, self.score

        #4 place new food or just move
        if self.head == self.food:
            self.score += 1
            reward = 10
            self._place_food()
        else:
            self.snake.pop()

        #5 update ui and clock
        self._ui_update()

        '''if self.score % 5 == 0:
            self.SPEED += 0.1'''

        self.clock.tick(self.SPEED)

        #6 return game over and score
        return reward, game_over, self.score
