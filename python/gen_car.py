name_table = []
with open('car.txt') as f:
    lines = f.read().splitlines()
    for line in lines:
        l = line.split()
        name_table.append(l[0])

with open('new_label.txt') as g:
    lines = g.read().splitlines()
    for line in lines:
        l = line.split()
        for index in range(len(name_table)):
            if l[0] == name_table[index]:  # same image
                print("%s %s %s %s %s %s" %(l[0], l[1], l[2], l[3], l[4], l[5]))
                break
