#include <cstdio>
#include <cstdlib>
#include "common.hpp"

using namespace cv;
using namespace std;

namespace lbf {

	LbfCascador::LbfCascador() {}
	LbfCascador::~LbfCascador() {}

	void LbfCascador::Init(int stages_n) {
		Config &config = Config::GetInstance();
		this->stages_n = stages_n;
		this->landmark_n = config.landmark_n;
		random_forests.resize(stages_n);
		for (int i = 0; i < stages_n; i++) random_forests[i].Init(config.landmark_n, config.tree_n, config.tree_depth);
		mean_shape.create(config.landmark_n, 2, CV_64FC1);
		gl_regression_weights.resize(stages_n);
		int F = config.landmark_n * config.tree_n * (1 << (config.tree_depth - 1));
		for (int i = 0; i < stages_n; i++) {
			gl_regression_weights[i].create(2 * config.landmark_n, F, CV_64FC1);
		}
	}

	// Global Regression to predict delta shape with LBF

	Mat LbfCascador::GlobalRegressionPredict(const Mat &lbf, int stage) {
		const Mat_<double> &weight = (Mat_<double>)gl_regression_weights[stage];
		Mat_<double> delta_shape(weight.rows / 2, 2);
		const double *w_ptr = NULL;
		const int *lbf_ptr = lbf.ptr<int>(0);

		//#pragma omp parallel for num_threads(2) private(w_ptr)
		for (int i = 0; i < delta_shape.rows; i++) {
			w_ptr = weight.ptr<double>(2 * i);
			double y = 0;
			for (int j = 0; j < lbf.cols; j++) y += w_ptr[lbf_ptr[j]];
			delta_shape(i, 0) = y;

			w_ptr = weight.ptr<double>(2 * i + 1);
			y = 0;
			for (int j = 0; j < lbf.cols; j++) y += w_ptr[lbf_ptr[j]];
			delta_shape(i, 1) = y;
		}
		return delta_shape;
	}

	Mat LbfCascador::Predict(Mat &img, BBox &bbox) {
		Mat current_shape = bbox.ReProject(mean_shape);  //init
		double scale;
		Mat rotate;
		for (int k = 0; k < stages_n; k++) {
			// generate lbf
			Mat lbf = random_forests[k].GenerateLBF(img, current_shape, bbox, mean_shape);
			// update current_shapes
			Mat delta_shape = GlobalRegressionPredict(lbf, k);
			delta_shape = delta_shape.reshape(0, landmark_n);
			calcSimilarityTransform(bbox.Project(current_shape), mean_shape, scale, rotate);
			current_shape = bbox.ReProject(bbox.Project(current_shape) + scale * delta_shape * rotate.t());
		}
		return current_shape;
	}

	void LbfCascador::Read(FILE *fd) {
		Config &config = Config::GetInstance();
		// global parameters
		fread(&config.stages_n, sizeof(int), 1, fd);
		fread(&config.tree_n, sizeof(int), 1, fd);
		fread(&config.tree_depth, sizeof(int), 1, fd);
		fread(&config.landmark_n, sizeof(int), 1, fd);
		stages_n = config.stages_n;
		landmark_n = config.landmark_n;
		// initialize
		Init(stages_n);
		// mean_shape
		double *ptr = NULL;
		for (int i = 0; i < mean_shape.rows; i++) {
			ptr = mean_shape.ptr<double>(i);
			fread(ptr, sizeof(double), mean_shape.cols, fd);
		}
		// every stages
		for (int k = 0; k < stages_n; k++) {
			random_forests[k].Read(fd);
			for (int i = 0; i < 2 * config.landmark_n; i++) {
				ptr = gl_regression_weights[k].ptr<double>(i);
				fread(ptr, sizeof(double), gl_regression_weights[k].cols, fd);
			}
		}
	}

	void LbfCascador::Write(FILE *fd) {
		Config &config = Config::GetInstance();
		// global parameters
		fwrite(&config.stages_n, sizeof(int), 1, fd);
		fwrite(&config.tree_n, sizeof(int), 1, fd);
		fwrite(&config.tree_depth, sizeof(int), 1, fd);
		fwrite(&config.landmark_n, sizeof(int), 1, fd);
		// mean_shape
		double *ptr = NULL;
		for (int i = 0; i < mean_shape.rows; i++) {
			ptr = mean_shape.ptr<double>(i);
			fwrite(ptr, sizeof(double), mean_shape.cols, fd);
		}
		// every stages
		for (int k = 0; k < config.stages_n; k++) {
			LOG("Write %dth stage", k);
			random_forests[k].Write(fd);
			for (int i = 0; i < 2 * config.landmark_n; i++) {
				ptr = gl_regression_weights[k].ptr<double>(i);
				fwrite(ptr, sizeof(double), gl_regression_weights[k].cols, fd);
			}
		}
	}

} // namespace lbf
