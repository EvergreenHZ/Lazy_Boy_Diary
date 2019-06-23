with open('/etc/passwd') as f:
    for line in f:
        print(line)

with open('/etc/passed') as f:
    content = f.readlines()
    content = [x.strip() for x in content]  # to remove '\n'
