#include<iostream>

#define DIMENSION 79800
class Point{
	public:
		int x;
		int y;

		Point():x(0), y(0) {}
		Point(int xx, int yy): x(xx), y(yy) {}
};

void getIndexVector(vector<Point>& vec)
{
	vec.reserve(DIMENSION);
	for (int i = 0; i < pixels; i++) {
		for (int j = 0; j < pixels; j++) {
			Point p(i, j);
			vec.push_back(p);
		}
	}
	return ;
}
//Point p = vec(featId);
//xx = *(ima.data + p.x);
//yy = *(ima.data + p.y);
//npd_table.at<unsigned char>(xx, yy);
