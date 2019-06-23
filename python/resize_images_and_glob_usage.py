import os
import numpy as np
import cv2
import glob
from os.path import isfile, join

# just override
# os.listdir("/home/huaizhi/")
# onlyfiles = [f for f in listdir("/home/huaizhi/") if isfile(join("/home/huaizhi/", f))]

# read all images
standard_jpg_images = [cv2.imread(file) for file in glob.glob("/home/huaizhi/images/*.jpg")]
standard_png_images = [cv2.imread(file) for file in glob.glob("/home/huaizhi/images/*.png")]
standard_images = standard_jpg_images + standard_png_images

candidate_images = [cv2.imread(file) for file in glob.glob("/home/huaizhi/novel_images/*.jpg")]

# get image names
standard_images_names = glob.glob("/home/huaizhi/images/*.jpg")
standard_images_names = standard_images_names + glob.glob("/home/huaizhi/images/*.png")
names = [image_name.split("/")[-1] for image_name in standard_images_names]

path_prefix = "/home/huaizhi/output/"

target_images = []

#for i in range(len(standard_images)):
for i in range(len(candidate_images)):
    #print(standard_images[i].shape)
    height, width, channel = standard_images[i].shape
    #print("%d %d %d" %(height, width, channel))
    #target_images.append(cv2.resize(candidate_images[i]), (720, 640))

    # show image
    #tmp = cv2.resize(candidate_images[i], (720, 640))
    #cv2.namedWindow('hello', cv2.WINDOW_NORMAL)
    #cv2.imshow("hello", tmp)
    #cv2.waitKey(0)

    target_images.append(cv2.resize(candidate_images[i], (width, height)))

#for i in range(len(names)):
for i in range(len(target_images)):
    saved_name = path_prefix + names[i]

    cv2.namedWindow('hello', cv2.WINDOW_NORMAL)
    cv2.imshow("hello", target_images[i])
    cv2.waitKey(0)

    cv2.imwrite(saved_name, target_images[i])
    print("save image " + saved_name)
