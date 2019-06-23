#include<iostream>
#include<string>
#include<fstream>
#include<cstdlib>
#include<cstdio>
#include<ctime>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/core/core.hpp>
#include<opencv2/imgproc/imgproc.hpp>

using namespace std;
using namespace cv;

#define NUM 1
#define WIDTH 20
#define HEIGHT 20
int COUNT = 0;
void GridScan(char *ima_name)
{
	Mat ima = imread(ima_name, CV_LOAD_IMAGE_GRAYSCALE);
	int row = ima.rows;
	int col = ima.cols;
	float scale = 1;
	int k = 0;
	char extension[] = ".png";

	for (; row / scale >= 20 && col / scale >= 20; k++) {
		scale *= pow(1.1, k); 
		Mat tmp;
		resize(ima, tmp, Size(), 1 / scale, 1/ scale);

		int t_row = tmp.rows;
		int t_col = tmp.cols;
		cout<<t_row<<" "<<t_col<<endl;

		for (int i = 0; i <= t_row - 20; i += 20) {
			for (int j = 0; j <= t_col - 20; j += 20) {
				COUNT++;
				Mat win(20, 20, CV_8UC1);

				Rect rect = Rect(j, i, WIDTH, HEIGHT);
				ima(rect).copyTo(win);

				char name[20];
				char tmp[10];
				sprintf(tmp, "%d", COUNT);
				sprintf(name, "%d", i);
				strcat(name, tmp);
				strcat(name, extension);

				imwrite(name, win);
			}
		}
	}
}


int main(int argc, char* argv[])
{
	GridScan(argv[1]);

	return 0;
}
