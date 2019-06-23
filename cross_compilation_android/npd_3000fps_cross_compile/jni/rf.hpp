#ifndef RANDOMFOREST_HPP
#define RANDOMFOREST_HPP

#include <vector>
#include <opencv2/core/core.hpp>
#include "common.hpp"

namespace lbf {

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

} // namespace lbf

#endif // RANDOMFOREST_HPP
