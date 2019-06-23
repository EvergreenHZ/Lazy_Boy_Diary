'''
    record_one.txt: bad_image list
    test_set      : pair list
    remove bad image from test_set '''

<<<<<<< HEAD
import sys

def filter(bad_image_list, pair_list):
    with open(bad_image_list) as f:
        compared_list = f.read().splitlines()  # one string
        print len(compared_list)

        with open(pair_list) as g:
            ori_list = g.read().splitlines()  # one string
            # print ori_list
            result = []
            for item in ori_list:
                l = item.split()
                result.append(l[0])

            i = -1
            for item in result:
                i  = i + 1
                if item in compared_list:
                    continue

                print ori_list[i]

if __name__ == '__main__':
    bad_image_list = sys.argv[1]
    pair_list      = sys.argv[2]

    filter(bad_image_list, pair_list)
=======
#with open('record_one.txt') as f:
#    compared_list = f.read().splitlines()  # one string
#    print len(compared_list)
#
#    with open('test_set.txt') as g:
#        ori_list = g.read().splitlines()  # one string
#        # print ori_list
#        result = []
#        for item in ori_list:
#            l = item.split()
#            result.append(l[0])
#
#        i = -1
#        for item in result:
#            i  = i + 1
#            if item in compared_list:
#                continue
#
#            print ori_list[i]

import sys

def kick_bad(image_name_list_all, image_name_list_bad):
    for item in image_name_list_all:
        if item in image_name_list_bad:
            continue
        else:
            print(item)

def read_file(file_path):
    with open(file_path) as f:
        name_list = f.read().splitlines()

    return name_list

def do_it(file_path_all, file_path_bad):
    image_name_list_all = read_file(file_path_all)
    image_name_list_bad = raed_file(file_path_bad)

    kick_bad(image_name_list_all, image_name_list_bad)

if __name__ == '__main__':
    file_path_all = sys.argv[1]
    file_path_bad = sys.argv[2]
    do_it(file_path_all, file_path_bad)
>>>>>>> huaizhi
