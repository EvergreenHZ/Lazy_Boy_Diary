'''
    record_one.txt: bad_image list
    test_set      : pair list
    remove bad image from test_set '''

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
