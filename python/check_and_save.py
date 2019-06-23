import numpy as np
import cv2

saved_path_list = ['./sort/bad_rotation/',
                   './sort/dark/',
                   './sort/low_resolusion/',
                   './sort/cover/',
                   './sort/head_down/',
                   './sort/partial_face/',
                   './sort/face_rotate/',
                   './sort/wait_to_determine']
with open('./list.txt') as f:
    img_path_list = f.readlines()
    img_path_list = [x.strip() for x in img_path_list]

    for img_path in img_path_list:
        image = cv2.imread(img_path)
        tmp_image = cv2.resize(image, (960, 1024), interpolation=cv2.INTER_CUBIC)
        cv2.imshow('check', tmp_image)

        key = cv2.waitKey(0) & 0xFF
        if key == ord('b'):
            saved_name = saved_path_list[0]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('d'):
            saved_name = saved_path_list[1]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('l'):
            saved_name = saved_path_list[2]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('c'):
            saved_name = saved_path_list[3]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('h'):
            saved_name = saved_path_list[4]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('p'):
            saved_name = saved_path_list[5]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('f'):
            saved_name = saved_path_list[6]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        elif key == ord('w'):
            saved_name = saved_path_list[7]
            saved_name += img_path
            cv2.imwrite(saved_name, image)
        else:
            continue
