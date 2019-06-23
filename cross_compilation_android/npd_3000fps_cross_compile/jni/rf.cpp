#include <cmath>
#include <cstdio>
#include <cassert>
#include "common.hpp"

using namespace cv;
using namespace std;

namespace lbf {

#define SIMILARITY_TRANSFORM(x, y, scale, rotate) do {            \
	double x_tmp = scale * (rotate(0, 0)*x + rotate(0, 1)*y); \
	double y_tmp = scale * (rotate(1, 0)*x + rotate(1, 1)*y); \
	x = x_tmp; y = y_tmp;                                     \
} while(0)

RandomTree::RandomTree() {}
RandomTree::~RandomTree() {}

void RandomTree::Init(int landmark_id, int depth) {
	this->landmark_id = landmark_id;
	this->depth = depth;
	nodes_n = 1 << depth;  // 2^depth
	feats = Mat::zeros(nodes_n, 4, CV_64FC1);
	thresholds.resize(nodes_n);
}



void RandomTree::Read(FILE *fd) {
	Config &config = Config::GetInstance();
	// initialize
	Init(0, config.tree_depth);
	for (int i = 1; i < nodes_n / 2; i++) {
		fread(feats.ptr<double>(i), sizeof(double), 4, fd);
		fread(&thresholds[i], sizeof(int), 1, fd);
	}
}

void RandomTree::Write(FILE *fd) {
	for (int i = 1; i < nodes_n / 2; i++) {
		fwrite(feats.ptr<double>(i), sizeof(double), 4, fd);
		fwrite(&thresholds[i], sizeof(int), 1, fd);
	}
}


RandomForest::RandomForest() {}
RandomForest::~RandomForest() {}

void RandomForest::Init(int landmark_n, int trees_n, int tree_depth) {
	random_trees.resize(landmark_n);
	for (int i = 0; i < landmark_n; i++) {  //68
		random_trees[i].resize(trees_n);
		for (int j = 0; j < trees_n; j++) random_trees[i][j].Init(i, tree_depth);
	}
	this->trees_n = trees_n;
	this->landmark_n = landmark_n;
	this->tree_depth = tree_depth;
}


Mat RandomForest::GenerateLBF(Mat &img, Mat &current_shape, BBox &bbox, Mat &mean_shape) {
	Mat_<int> lbf(1, landmark_n*trees_n);  //big one
	double scale;
	Mat_<double> rotate;
	calcSimilarityTransform(bbox.Project(current_shape), mean_shape, scale, rotate);  //inverse transformation

	int base = 1 << (tree_depth - 1);  //#leaf nodes

	//#pragma omp parallel for num_threads(2)
	for (int i = 0; i < landmark_n; i++) {
		for (int j = 0; j < trees_n; j++) {
			RandomTree &tree = random_trees[i][j];
			int code = 0;
			int idx = 1;
			for (int k = 1; k < tree.depth; k++) {
				double x1 = tree.feats(idx, 0);
				double y1 = tree.feats(idx, 1);
				double x2 = tree.feats(idx, 2);
				double y2 = tree.feats(idx, 3);
				SIMILARITY_TRANSFORM(x1, y1, scale, rotate);
				SIMILARITY_TRANSFORM(x2, y2, scale, rotate);

				x1 = x1*bbox.x_scale + current_shape.at<double>(i, 0);
				y1 = y1*bbox.y_scale + current_shape.at<double>(i, 1);
				x2 = x2*bbox.x_scale + current_shape.at<double>(i, 0);
				y2 = y2*bbox.y_scale + current_shape.at<double>(i, 1);
				x1 = max(0., min(img.cols - 1., x1)); y1 = max(0., min(img.rows - 1., y1));
				x2 = max(0., min(img.cols - 1., x2)); y2 = max(0., min(img.rows - 1., y2));
				int density = img.at<uchar>(int(y1), int(x1)) - img.at<uchar>(int(y2), int(x2));
				code <<= 1;  //here
				if (density < tree.thresholds[idx]) {
					idx = 2 * idx;
				}
				else {
					code += 1;  //here
					idx = 2 * idx + 1;
				}
			}
			lbf(i*trees_n + j) = (i*trees_n + j)*base + code;  //code, the slot
		}
	}
	return lbf;
}


void RandomForest::Read(FILE *fd) {
	Config &config = Config::GetInstance();
	// initialize
	Init(config.landmark_n, config.tree_n, config.tree_depth);
	for (int i = 0; i < landmark_n; i++) {
		for (int j = 0; j < trees_n; j++) {
			random_trees[i][j].Read(fd);
		}
	}
}

void RandomForest::Write(FILE *fd) {
	for (int i = 0; i < landmark_n; i++) {
		for (int j = 0; j < trees_n; j++) {
			random_trees[i][j].Write(fd);
		}
	}
}

} // namespace lbf
