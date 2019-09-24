# -*- coding: utf-8 -*-
import json
import csv


def read_json_file_into_list(filename):
    # load json file
    info_list = None
    with open(filename, 'r', encoding='utf-8') as f:
        info_list = json.load(f)
        #print(len(list(info_list)))
        return list(info_list)


def read_csv(csv_filename):
    # read csv file
    with open(csv_filename, 'r') as f:
        reader = csv.reader(f, delimiter=',')

        # get list
        rows = list(reader)

        #m = { item[0] : int(item[-1]) for item in rows if int(item[-1]) >= 2}
        m = {}
        for item in rows:
            if int(item[-1]) >= 2:
                #print(item)
                m[item[1]] = True
        print(len(m))
        return m


def save_jsonfile(filename, result):
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=4, ensure_ascii=False)


def process_task(json_file, csv_file):
    json_list = read_json_file_into_list(json_file)
    m         = read_csv(csv_file)

    print(len(json_list))

    result_gt_or_eq = []  # >= 2 great than or equal to
    result_the_other = []  # the other one

    for json_obj in json_list:
        medicine_name = json_obj['ch_name']

        if medicine_name in m:
            result_gt_or_eq.append(json_obj)
        else:
            result_the_other.append(json_obj)

    #print(len(m))
    #print(len(result_gt_or_eq))

    #print(result_gt_or_eq)


    # save to files
    first_file = 'gt_or_eq.json'
    second_file = 'the_other.json'
    save_jsonfile(first_file, result_gt_or_eq)
    save_jsonfile(second_file, result_the_other)

if __name__ == '__main__':
    json_file = 'db.json'
    csv_file = 'matching_result.csv'
    process_task(json_file, csv_file)
