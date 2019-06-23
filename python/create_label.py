# this is used to create a label_deploy.txt
# check ssd
with open('labels') as f:
    lines = f.read().splitlines()  # this is a list
    with open('new.txt', 'w') as nf:
        i = 0
        for item in lines:
            nf.write("item {\n\tname: \"%s\"\n\tlabel: %d\n\tdisplay_name: \"%s\"\n}\n" % (item, i, item))
            i = i + 1
