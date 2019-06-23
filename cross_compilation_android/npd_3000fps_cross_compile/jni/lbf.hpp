#ifndef LBF_HPP_
#define LBF_HPP_

#include <vector>
#include "rf.hpp"

namespace lbf {

	class LbfCascador {
		public:
			LbfCascador();
			~LbfCascador();
			//LbfCascador(const LbfCascador &other);
			//LbfCascador &operator=(const LbfCascador &other);

		public:
			void Init(int stages_n);
			cv::Mat GlobalRegressionPredict(const cv::Mat &lbf, int stage);
			cv::Mat Predict(cv::Mat &img, BBox &bbox);

			void Read(FILE *fd);
			void Write(FILE *fd);

                private:
			int stages_n;
			int landmark_n;
			cv::Mat mean_shape;
			std::vector<RandomForest> random_forests;
			std::vector<cv::Mat> gl_regression_weights;
	};

} // namespace lbf

#endif // LBF_HPP_
