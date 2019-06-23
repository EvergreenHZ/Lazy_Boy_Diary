import cv2

with open('./diff_faces') as f:
    lines = f.read().splitlines()
    image_name_list = []
    for line in lines:
        image_name_list.append(line.split())

    same = 'same/'
    diff = 'diff/'
    multi_faces = 'multi_faces/'
    face_down_not_same = 'face_down_not_same/'
    I_can_not_recg = 'I_can_not_recg/'
    unknown_reason  = 'unknown_reason/'

    for pair in image_name_list:
        image1 = cv2.imread(pair[0])
        image2 = cv2.imread(pair[1])

        saved_name1 = ((pair[0]).split('/'))[-1]
        saved_name2 = ((pair[1]).split('/'))[-1]

        cv2.imshow('left', cv2.resize(image1, (960, 640), interpolation=cv2.INTER_CUBIC))
        cv2.imshow('right', cv2.resize(image2, (960, 640), interpolation=cv2.INTER_CUBIC))
        #cv2.imshow('right', image2)

        key = cv2.waitKey(0) & 0xFF

        if key == ord('s'):
            saved_name1 = same + saved_name1
            saved_name2 = same + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)
        elif key == ord('d'):
            saved_name1 = diff + saved_name1
            saved_name2 = diff + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)
        elif key == ord('m'):
            saved_name1 = multi_faces + saved_name1
            saved_name2 = multi_faces + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)
        elif key == ord('f'):
            saved_name1 = face_down_not_same + saved_name1
            saved_name2 = face_down_not_same + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)
        elif key == ord('i'):
            saved_name1 = I_can_not_recg + saved_name1
            saved_name2 = I_can_not_recg + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)
        elif key == ord('u'):
            saved_name1 = unknown_reason + saved_name1
            saved_name2 = unknown_reason + saved_name2
            cv2.imwrite(saved_name1, image1)
            cv2.imwrite(saved_name2, image2)

        else:
            continue
