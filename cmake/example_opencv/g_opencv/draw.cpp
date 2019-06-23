#include<iostream>
#include"opencv2/core/core.hpp"
#include"opencv2/highgui/highgui.hpp"
#include"opencv2/imgproc/imgproc.hpp"

using namespace std;
using namespace cv;

int main(int argc, char* argv[])
{
	Mat ima= imread("./gigi.jpg", 0);
	//resize(ima, ima, Size(20, 20));

	//Rect rect(120, 80, 400, 400);

	//rectangle(ima, rect, Scalar(255, 0, 0));

	cvNamedWindow("test", 0);
	imshow("test", ima);
	waitKey(0);

	//string name("a.jpg");
	//imwrite(name, ima);

	return 0;
}
