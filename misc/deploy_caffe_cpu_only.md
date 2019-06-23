# System
uname -a
Linux Manjaro 4.19.32-1-MANJARO #1 SMP PREEMPT Wed Mar 27 18:55:07 UTC 2019 x86_64 GNU/Linux

# Prerequisites
+ OpenBlas
+ Boost 1.69.0-1
+ protobuf, glog, gflags, hdf5
+ OpenCV 4.0.1

# Step
cd caffe
mkdir build
cd build
cmake -DBLAS=open ..
make all -j4;  # you will find some errors about OpenCV 4, change all the macros
make test
make runtest

# trbouleshoting
You will find some OpenCV Marcos are not declared (say CV_LOAD_IMAGE_COLOR)
check [here](https://github.com/BVLC/caffe/pull/6625/commits/7f503bd9a19758a173064e299ab9d4cac65ed60f)
