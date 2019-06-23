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

void callMeToTrack(VideoCapture& cap, npddetect& d, Mat& frame);
int main()
{

	VideoCapture cap("../res/v.mp4"); 
	// Check if camera opened successfully
	if(!cap.isOpened()){
		cout << "Error opening video stream or file" << endl;
		return -1;
	}

	// get detector
	npddetect detector;
	detector.load("../res/result.bin");

	Ptr<Tracker> tracker = TrackerKCF::create();

	// check the first frame
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

	unsigned int count = 1;
	while(1){

		cap >> frame;

		if (frame.cols >= 640 && frame.rows >= 480)
			resize(frame, frame, Size(640, 480));
		if (frame.empty()) break;

		if (count++ % 2 != 0) {
			callMeToTrack(cap, detector, frame);
		}

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

		// Display the resulting frame & press esc to stop
		imshow( "Frame", frame );
		char c=(char)waitKey(30);
		if(c==27) break;
	}

	cap.release();
	destroyAllWindows();
	return 0;
}

void callMeToTrack(VideoCapture& cap, npddetect& d, Mat& frame)
{
	//Mat frame;
	//cap >> frame;
	d.initTrackers(frame);

	for (int i = 0; i < 5; i++) {

		d.trackers.update(frame);

		for(unsigned i = 0; i < d.trackers.getObjects().size(); i++)
			rectangle( frame, d.trackers.getObjects()[i], Scalar( 0, 255,  0 ), 2, 1 );
		imshow("Frame",frame);

		cap >> frame;
		if (frame.empty()) return;
	}

	return ;
}
