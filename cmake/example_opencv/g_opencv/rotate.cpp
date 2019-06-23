#include<iostream>
#include<string>
#include<vector>
#include"opencv2/core/core.hpp"
#include"opencv2/highgui/highgui.hpp"
#include"opencv2/imgproc/imgproc.hpp"

using namespace std;
using namespace cv;

int main(int argc, char* argv[])
{
	ifstream inf(argv[1]);
	string name, extension(".jpg");
	int x = 0;
	while (getline(inf, name)) {
		Mat ima= imread(name.c_str(), 1);

		Point2f center = Point2f(ima.cols / 2, ima.rows / 2);
		double angle = 15;
		double scale = 1;
		Mat rotateMat = getRotationMatrix2D(center, angle, scale);  //get transformation matrix

		Mat out;
		warpAffine(ima, out, rotateMat, ima.size());


		string out_name("x");
		out_name += name;
		imwrite(out_name, out);
	}
	//flip(input, output, flag);

	return 0;
}
