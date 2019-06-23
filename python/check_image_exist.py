import cv2

i = 0
with open('t') as f:
    names = f.read().splitlines()
    for name in names:
        img = cv2.imread(name)
        if img is None:
            print i
            i = i + 1
