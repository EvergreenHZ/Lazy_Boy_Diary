#include "opencv2/opencv.hpp"
#include "npddetect.h"
#include "npdmodel.h"
#include <iostream>
#include<string>
#include <opencv2/tracking.hpp>
#include <opencv2/tracking/tracking.hpp>
#include <opencv2/core/ocl.hpp>
using namespace std;
using namespace cv;
using namespace npd;

int main(){

	VideoCapture cap("../res/v.mp4"); 
	npddetect detector;
	detector.load("../res/result.bin");

	// Check if camera opened successfully
	if(!cap.isOpened()){
		cout << "Error opening video stream or file" << endl;
		return -1;
	}

	Ptr<Tracker> tracker = TrackerKCF::create();

	Mat frame;
	cap >> frame;
	Mat gray;
	cvtColor(frame, gray, CV_BGR2GRAY);
	detector.detect(gray.data, gray.cols, gray.rows);
	float score = 15;
	vector< int >& Xs = detector.getXs();
	vector< int >& Ys = detector.getYs();
	vector< int >& Ss = detector.getSs();
	vector< float >& Scores = detector.getScores();

	Rect2d bbox(Xs[0] - 20, Ys[0] - 20, Ss[0] + 20, Ss[0] + 20);
	tracker->init(frame, bbox);

	char buf[10];
	for(int i = 0; i < Xs.size(); i++)
	{
		cout<<Scores[i]<<" ";
		if(score > 0. && Scores[i] < score)
			continue;
		sprintf(buf, "%.3f", Scores[i]);
		cv::rectangle(frame, cv::Rect(Xs[i], Ys[i], Ss[i], Ss[i]), 
				cv::Scalar(0, 255, 0), 2, 1);
		cv::putText(frame, buf, cv::Point(Xs[i], Ys[i]), 1, 0.5, cv::Scalar(0, 0, 255)); 
	} cout<<endl;
	// Display the resulting frame
	imshow( "Frame", frame );
	int count = 0;
	while(1){

		cap >> frame;

		if (frame.cols >= 640 && frame.rows >= 480)
			resize(frame, frame, Size(640, 480));
		if (frame.empty()) break;


		if (count++ % 5 != 0) {
		  tracker->update(frame, bbox);
		  rectangle(frame, bbox, Scalar(0, 255, 0 ), 2, 1 );
		  imshow( "Frame", frame );
		  continue;
		  }

		//count = 1;
		Mat gray;
		cvtColor(frame, gray, CV_BGR2GRAY);
		int num = detector.detect(gray.data, gray.cols, gray.rows);
		Xs = detector.getXs();
		Ys = detector.getYs();
		Ss = detector.getSs();
		Scores = detector.getScores();
		char buf[10];
		for(int i = 0; i < Xs.size(); i++)
		{
			cout<<Scores[i]<<" ";
			if(score > 0. && Scores[i] < score)
				continue;
			sprintf(buf, "%.3f", Scores[i]);
			cv::rectangle(frame, cv::Rect(Xs[i], Ys[i], Ss[i], Ss[i]),
					cv::Scalar(0, 255, 0), 2, 1);
			cv::putText(frame, buf, cv::Point(Xs[i], Ys[i]), 1, 0.5, cv::Scalar(0, 0, 255)); 
		} cout<<endl;

		// Display the resulting frame
		imshow( "Frame", frame );

		// Press  ESC on keyboard to exit
		char c=(char)waitKey(30);
		if(c==27) break;
	}

	cap.release();
	destroyAllWindows();

	return 0;
}
