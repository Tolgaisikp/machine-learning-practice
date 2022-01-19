import cv2
import pytesseract as tess

tess.pytesseract.tesseract_cmd = r'C:\Users\Tolga\AppData\Local\tesseract.exe'
img = cv2.imread('comic-image.png')
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

hImg,wImg,_=img.shape
boxes = tess.image_to_boxes(img)
for b in boxes.splitlines():
    b = b.split(' ')
    x,y,w,h =int(b[1]),int(b[2]),int(b[3]),int(b[4])
    cv2.rectangle(img,(x,hImg-y),(w,hImg-h),(0,0,255),1)

print(tess.image_to_string(img))
print(tess.image_to_boxes(img))
cv2.imshow('Result', img)
cv2.waitKey(0)


