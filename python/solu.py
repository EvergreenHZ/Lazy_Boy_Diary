# read entry string and instruction
entry_string = raw_input()
instruction = raw_input()

entrys = entry_string.split(';')
names = []
values = []

# resolve entrys and values
for entry in entrys:
    name_vs_value = entry.split('_')
    name = name_vs_value[0]
    value = name_vs_value[1].split('|')

    names.append(name)
    values.append(value)


matched_key = []
matched_name = []
max_len = -1
for i in range(len(names)):
    tmp_key = False
    for j in range(len(values[i])):
        value = values[i][j]
        if instruction.find(value):
            if max_len < len(value):
                max_len = len(value)
                tmp_key = value
    if tmp_key:
        matched_key.append(tmp_key)
        for x in range(len(names)):
            for y in range(len(value)):
                if tmp_key == values[x][y]:
                    matched_name.append(names[x])
        #matched_name.append(names[i])


print "请播放 ",

for i in range(len(matched_key)):
    print matched_key[i] ,
    print "\\" ,
    print matched_name[i][0] ,

    if len(matched_name[i]) == 1:
        continue
    flag = 1
    for item in matched_name[i]:
        print ",",
        if flag == 1:
            flag = 2
            continue
        print item ,
    print "的",
    if i == len(matched_key) - 2:
        break

print "给我听"
