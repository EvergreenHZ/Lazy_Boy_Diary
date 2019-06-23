#include <iostream>
#include "npddetect.h"
#include <vector>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/core/core.hpp>

using namespace std;
using namespace npd;
using namespace cv;

int main(int ac, char* av[])
{
        npddetect npd;
        npd.load("../model/result.bin");
        npd.loadAlignModel("../model/68.model");

        vector<int> result;
        Mat image = imread(av[1], CV_LOAD_IMAGE_GRAYSCALE);
        Mat color_image = imread(av[1], 1);

        //result = npd.detect_and_align((signed char*)image.data, image.rows, image.cols);
        result = npd.detect_and_align((signed char*)image.data, image.cols, image.rows);

        for (int i = 0; i < result.size(); i++) {
                cout << result[i] << " ";
        } cout << endl;

        cout << result.size() << endl;


        if (result.size() > 0) {
                int x, y, w, h;
                x = result[0];
                y = result[1];
                w = result[2];
                h = result[3];

                rectangle(image, Rect(x, y, w, h), Scalar(0, 0, 255), 2);
                rectangle(color_image, Rect(x, y, w, h), Scalar(0, 0, 255), 2);

                for (int i = 4; i < result.size(); i += 2) {
                        //circle(image, Point(result[i], result[i + 1]), 2, Scalar(0, 255, 0), -1);
                        circle(color_image, Point(result[i], result[i + 1]), 2, Scalar(0, 255, 0), -1);
                }
                Mat roi;
                resize(color_image, roi, Size(), 0.75, 0.75);
                imshow("hello", roi);
                //imshow("hello", image);
                waitKey(0);
        }

        return 0;
}
