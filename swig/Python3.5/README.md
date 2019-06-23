usage:
	$python3.5
	>>import detect			#import the package -- detect
	>>x = detect.npddetect()	#use the npddetect attributes of detect
					#and you get an object detector
	>>detector.load("result.bin")	#load the model file result.bin
	>>detector.detect("2.jpg")	#detect the image 2.jpg and you'll get 1.jpg in
					#current directory named as "1.jpg"
					#check 1.jpg and see the result
	>>x = detector.getXs()		#you get the X coordinates of the rectangles
	>>y = detector.getYs()		#.. .. .. Y .. .. .. .. 
	>>s = detectot.getSs()		#s indicates the size of the rectangles

	>>x.get(0)			#access the element
	>>y.get(1)			#same as y, s
	>>s.get(0)


	>>s.size()			#size of the vector
