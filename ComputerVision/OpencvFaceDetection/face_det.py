#Şu an genelde derin öğrenme modelleri kullanılmaktadır.
import cv2
import imageio

face_cascade = cv2.CascadeClassifier("haarcascade-frontalface-default.xml")
eye_cascade = cv2.CascadeClassifier("haarcascade-eye.xml")

def detect(frame):
    gray = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)#griye çevirdik
    faces = face_cascade.detectMultiScale(gray, 1.3, 6)
    #burada her framdeki yüzleri bulup x,y,h,w tupple olarak atarız
    #resim ,resim küçültme oranı, min komşu sayısı(birden fazla kernel varsa fazla işi engellemek)
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x,y), (x+w, y+h), (255, 255, 0), 2)
        #resim , solüst, sağalt, renk, kalınlık
        gray_face = gray[y:y+h, x:x+w]
        color_face = frame[y:y+h, x:x+w]
        eyes = eye_cascade.detectMultiScale(gray_face, 1.1, 3)
        for (ex, ey, ew, eh) in eyes:
            cv2.rectangle(color_face, (ex, ey), (ex + ew, ey + eh), (255, 255, 0), 2)
    return frame

reader = imageio.get_reader('1.mp4')
fps = reader.get_meta_data()['fps']
writer = imageio.get_writer('output.mp4', fps = fps)
for i, frame in enumerate(reader): #en döndüğünde frame i değiştircek ve i yi arttırıcak enumarate 2 parametre alıyor
    frame = detect(frame)
    writer.append_data(frame)
    print(i)

writer.close()