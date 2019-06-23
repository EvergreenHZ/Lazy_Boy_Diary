#ifndef COMMON_HPP_
#define COMMON_HPP_

#include <vector>
#include <string>
#include <opencv2/core/core.hpp>

#define TIMER_BEGIN { double __time__ = cv::getTickCount();
#define TIMER_NOW   ((cv::getTickCount() - __time__) / cv::getTickFrequency())
#define TIMER_END   }

namespace lbf {

        class BBox {
                public:
                        BBox();
                        ~BBox();
                        //BBox(const BBox &other);
                        //BBox &operator=(const BBox &other);
                        BBox(double x, double y, double w, double h);

                public:
                        cv::Mat Project(const cv::Mat &shape) const;
                        cv::Mat ReProject(const cv::Mat &shape) const;

                public:
                        double x, y;
                        double x_center, y_center;
                        double x_scale, y_scale;
                        double width, height;
        };

        class RandomTree {
                public:
                        RandomTree();
                        ~RandomTree();

                public:
                        void Init(int landmark_id, int depth);

                        void Read(FILE *fd);
                        void Write(FILE *fd);

                public:
                        int depth;
                        int nodes_n;
                        int landmark_id;
                        cv::Mat_<double> feats;
                        std::vector<int> thresholds;
        };

        class RandomForest {
                public:
                        RandomForest();
                        ~RandomForest();

                public:
                        void Init(int landmark_n, int trees_n, int tree_depth);
                        cv::Mat GenerateLBF(cv::Mat &img, cv::Mat &current_shape, BBox &bbox, cv::Mat &mean_shape);

                        void Read(FILE *fd);
                        void Write(FILE *fd);

                public:
                        int landmark_n;
                        int trees_n, tree_depth;
                        std::vector<std::vector<RandomTree> > random_trees;
        };
	class LbfCascador {
		public:
			LbfCascador();
			~LbfCascador();

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

        class Config {
                public:
                        static inline Config& GetInstance() {
                                static Config c;
                                return c;
                        }
                        static inline void setModelPath(Config& c, const char* new_model_path) {
                                c.saved_file_name = new_model_path;
                        }

                public:
                        int stages_n;
                        int tree_n;
                        int tree_depth;

                        std::string dataset;
                        std::string saved_file_name;
                        int landmark_n;
                        int initShape_n;
                        std::vector<int> feats_m;
                        std::vector<double> radius_m;
                        double bagging_overlap;
                        std::vector<int> pupils[2];

                public:
                        Config();
                        ~Config() {}
                        Config(const Config &other);
                        Config &operator=(const Config &other);
        };



        void calcSimilarityTransform(const cv::Mat &shape1, const cv::Mat &shape2, double &scale, cv::Mat &rotate);

        double calcVariance(const cv::Mat &vec);
        double calcVariance(const std::vector<double> &vec);
        double calcMeanError(std::vector<cv::Mat> &gt_shapes, std::vector<cv::Mat> &current_shapes);

        cv::Mat getMeanShape(std::vector<cv::Mat> &gt_shapes, std::vector<BBox> &bboxes);
        std::vector<cv::Mat> getDeltaShapes(std::vector<cv::Mat> &gt_shapes, std::vector<cv::Mat> &current_shapes, \
                        std::vector<BBox> &bboxes, cv::Mat &mean_shape);

        cv::Mat drawShapeInImage(const cv::Mat &img, const cv::Mat &shape, const BBox &bbox);

        void LOG(const char *fmt, ...);

} // namespace lbf

#endif // COMMON_HPP_
