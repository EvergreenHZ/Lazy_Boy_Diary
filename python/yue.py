# -*- coding: utf-8 -*-
import json
import csv


def read_json_file_into_list(filename):
    # load json file
    with open(filename, 'r', encoding='utf-8') as f:
        info_list = json.load(f)
        return info_list


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
                print(item)
                m[item[0]] = True
        return m


def save_jsonfile(filename, result):
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=4, ensure_ascii=False)


def process_task(json_file, csv_file):
    json_list = read_json_file_into_list(json_file)
    m         = read_csv(csv_file)

    result_gt_or_eq = []  # >= 2 great than or equal to
    result_the_other = []  # the other one

    for json_obj in json_list:
        atc_id = json_obj['atc_id']

        if atc_id in m:
            result_gt_or_eq.append(json_obj)
        else:
            result_the_other.append(json_obj)


    # save to files
    first_file = 'gt_or_eq.json'
    second_file = 'the_other.json'
    save_jsonfile(first_file, result_gt_or_eq)
    save_jsonfile(second_file, result_the_other)

if __name__ == '__main__':
    json_file = 'db.json'
    csv_file = 'matching_result.csv'
    process_task(json_file, csv_file)
