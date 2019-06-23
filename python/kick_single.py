import sys
def read_image_names(file_path):
    with open(file_path) as f:
        image_paths = f.read().splitlines()

        return image_paths

def kick(file_path, saved_name):
    image_paths = read_image_names(file_path)
    with open(saved_name, 'w') as f:
        length = len(image_paths)
        print(image_paths[0])
        for i in range(1, length - 1):
            previous = ((image_paths[i - 1]).split('-'))[0]
            current  = ((image_paths[i]).split('-'))[0]
            next_one = ((image_paths[i + 1]).split('-'))[0]

            if current != previous and current != next_one:
                continue
            else:
                print(image_paths[i])
        print(image_paths[length - 1])
