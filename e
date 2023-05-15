import cv2
import numpy as np

cap = cv2.VideoCapture(0)
fgbg = cv2.createBackgroundSubtractorMOG2()

while True:
    ret, frame = cap.read()
    fgmask = fgbg.apply(frame)

    count = np.count_nonzero(fgmask)
    print('Pixel Count:', count)

    if count > 5000:
        print("Motion Detected")
    else:
        print("No Motion Detected")

    cv2.imshow('frame', frame)
    cv2.imshow('mask', fgmask)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()