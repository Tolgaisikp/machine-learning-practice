import cv2
import numpy as np
import AIVirtualMouse.HandTrackingModule as htm
import time
import autopy

############################
wCam, hCam = 640, 480
pTime = 0
frameR = 70
smoothening = 6
plocX, plocY = 0, 0
clocX, clocY = 0, 0
############################

cap = cv2.VideoCapture(1)
cap.set(3, wCam)
cap.set(4, hCam)
detector = htm.handDetector(maxHands=1)
wScr, hScr = autopy.screen.size()

while True:
    # 1.Find hand Landmarks
    suscess, img = cap.read()
    img = detector.findHands(img)
    lmlist, bbox = detector.findPosition(img)  # landmark list box
    #print(len(lmlist))

    # 2. Get the tip of the index and middle fingers
    if len(lmlist) != 0:
        x1, y1 = lmlist[8][1:]
        x2, y2 = lmlist[12][1:]
        # print(x1, y1, x2, y2)

        # 3. Check which fingers are up
        fingers = detector.fingersUp()  # parmakları saklıyacağız
        # print(fingers)  # hangi parmak havada kaydeder [0,1,1,0,0] şeklinde işaret ve orta parmak 1 olarak kaydedilir
        cv2.rectangle(img, (frameR, frameR), (wCam - frameR, hCam - frameR), (255, 0, 0), 2)

        # 4. Only Index Finger : Moving Mode
        if fingers[1] == 1 and fingers[2] == 0:

            # 5. Convert Coordinates(640,480 to 1920,1080)
            x3 = np.interp(x1, (frameR, wCam - frameR), (0, wScr))
            y3 = np.interp(y1, (frameR, hCam - frameR), (0, hScr))  # bu değerleri mouse'a yolluyacaz

            # 6. Smoothen Values
            clocX = plocX + (x3 - plocX) / smoothening
            clocY = plocY + (y3 - plocY) / smoothening
            #print(x3, clocX)

            # 7. Move Mouse
            autopy.mouse.move((wScr - clocX), clocY)
            cv2.circle(img, (x1, y1), 15, (255, 0, 255), cv2.FILLED)
            plocX, plocY = clocX, clocY

        # 8. Both Index and middle fingers are up: Clicking Mode:
        if fingers[1] == 1 and fingers[2] == 1:

            # 9. Find distance between fingers
            length, img, lineInfo = detector.findDistance(8, 12, img)
            print(length)

            # 10. Click mouse if short
            if length < 30:
                cv2.circle(img, (lineInfo[4], lineInfo[5]), 15, (0, 255, 0), cv2.FILLED)
                autopy.mouse.click()

    # 11. Frame rate
    cTime = time.time()
    fps = 1 / (cTime - pTime)
    pTime = cTime
    cv2.putText(img, str(int(fps)), (10, 70), cv2.FONT_HERSHEY_COMPLEX_SMALL, 5, (255, 0, 0), 3)

    # 12. Display
    cv2.imshow("Video", img)
    cv2.waitKey(10)
