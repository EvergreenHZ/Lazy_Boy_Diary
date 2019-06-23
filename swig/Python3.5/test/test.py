import cv2
import numpy as np
import detect

img = cv2.imread("1.jpg", 0)
oned = img.ravel()
type(oned)
d = detect.npddetect()
d.load("result.bin")
d.pyDetect(oned, 188, 268)
