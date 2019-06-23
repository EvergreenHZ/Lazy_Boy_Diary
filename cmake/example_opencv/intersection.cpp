#include<iostream>
#include"opencv2/core/core.hpp"
#include"opencv2/highgui/highgui.hpp"
#include"opencv2/imgproc/imgproc.hpp"

using namespace std;
using namespace cv;

int main(int argc, char* argv[])
{
	Mat ima= imread("./Gigi.jpg", 1);
	cout<<(int)ima.at<unsigned char>(Point(0, 0))<<endl;

	int w = 600, h = 600;
	Rect rect1(120, 80, 400, 400);
	Rect rect2(w, h, 200, 200);

	float intersection_area = (rect1 & rect2).area();
	float union_area = (rect1 | rect2).area();
	cout<<intersection_area<<" "<<union_area<<endl;

	rectangle(ima, rect1, Scalar(255, 0, 0));
	rectangle(ima, rect2, Scalar(255, 0, 0));

	cvNamedWindow("test", 0);
	imshow("test", ima);
	waitKey(0);

	return 0;
}
