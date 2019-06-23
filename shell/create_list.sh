#!/bin/bash

root_dir=$HOME/data/VOCdevkit/  # /home/huaizhi/data/VOCdevkit/
sub_dir=ImageSets/Main
bash_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"  # /home/huaizhi/caffe/data/MyDataset/
for dataset in trainval test  # two loop
do
  dst_file=$bash_dir/$dataset.txt  # $HOME/caffe/data/MyDataset/trainval.txt
  if [ -f $dst_file ]
  then
    rm -f $dst_file
  fi
  for name in MyDataset
  do
    if [[ $dataset == "test" && $name == "VOC2012" ]]
    then
      continue
    fi
    echo "Create list for $name $dataset..."  # create list for MyDataset trainval
    dataset_file=$root_dir/$name/$sub_dir/$dataset.txt  # VOCdevkit/MyDataset/ImageSets/Main/trainval.txt

    img_file=$bash_dir/$dataset"_img.txt"  # /home/huaizhi/caffe/data/MyDataset/trainval_img.txt
    # make a copy of origin file and modify the file
    cp $dataset_file $img_file
    sed -i "s/^/$name\/JPEGImages\//g" $img_file
    sed -i "s/$/.jpg/g" $img_file

    label_file=$bash_dir/$dataset"_label.txt"  # /home/huaizhi/caffe/data/MyDataset/trainval_label.txt
    # make a copy of origin file and modify the file
    cp $dataset_file $label_file
    sed -i "s/^/$name\/Annotations\//g" $label_file
    sed -i "s/$/.xml/g" $label_file

    paste -d' ' $img_file $label_file >> $dst_file

    rm -f $label_file
    rm -f $img_file
  done

  # Generate image name and size infomation.
  if [ $dataset == "test" ]
  then
    $bash_dir/../../build/tools/get_image_size $root_dir $dst_file $bash_dir/$dataset"_name_size.txt"
  fi

  # Shuffle trainval file actually, I don't care
  if [ $dataset == "trainval" ]
  then
    rand_file=$dst_file.random
    cat $dst_file | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);' > $rand_file
    mv $rand_file $dst_file
  fi
done
