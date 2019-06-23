
with open('record_one.txt') as f:
    compared_list = f.read().splitlines()  # one string
    print len(compared_list)

    with open('test_set.txt') as g:
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
