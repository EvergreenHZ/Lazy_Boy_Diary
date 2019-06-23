#ifndef _NPD_npd_npddetect_H_
#define _NPD_npd_npddetect_H_

#include <math.h>
#include <omp.h>
#include <vector>
using namespace std;

#include "npdmodel.h"
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/core/core.hpp>



class npddetect{

	public:

		//void detectImage(const char* imgLists);

		npddetect();

		npddetect(int minFace, int maxFace);

		~npddetect();

		void load(const char* modelpath);

		int gridScan(const unsigned char * I, int width, int height, double stepR = 0.5, double thresR = 0.0);

		int detect(signed char I[], int width, int height);

		//int detecg(signed char I[], int width, int height, int rotate_degree);

		int detect(cv::Mat& ima);  //

		int detect(const char* imgPath);  //

		int prescandetect(signed char I[], int width, int height, double stepR = 0.5, double thresR = 0.0);

		std::vector< int >& getXs();
		std::vector< int >& getYs();
		std::vector< int >& getSs();
		std::vector< float >& getScores();

		void draw(const char*);
		void draw(const signed char I[], const int w, const int h, const char* saveName);

	private:

		int floodScoreMat(cv::Mat& mat, int rowMax, int colMax, int winStep);

		int scan(const unsigned char* I, int width, int height);

		int filter();

		int partition(char* predicate, int* root);

		void init(int minFace = 20, int maxFace = 400);

		void release();

		void reset();

		void mallocsacnspace(int s);

		void freesacnspace();

		void mallocdetectspace(int n);

		void freedetectspace();



		// Npd model.
		npdmodel m_model;

		// Detect parameter.
		int m_minFace;
		int m_maxFace;
		float m_overlappingThreshold;

		// Containers for the detected faces.
		vector< float > m_xs, m_ys;
		vector< float > m_sizes;
		vector< float > m_scores;

		vector< int > m_Xs, m_Ys, m_Ss;
		vector< float > m_Scores;

		int m_numScan;
		int m_numDetect;

		// Temp space.
		int m_maxScanNum;
		int m_maxDetectNum;

		// Scan size.
		char*   m_Tpredicate;
		int*    m_Troot;
		float*  m_Tlogweight;
		int*    m_Tparent;
		int*    m_Trank;

		// Detect size.
		int*    m_Tneighbors;
		float*  m_Tweight;
		float*  m_Txs;
		float*  m_Tys;
		float*  m_Tss;
};
//    npddetect npddetector;
#endif
