# Getting and cleaning data project code book

## Purpose of this document
The aim of this document is to give some information on the data in this
project. It will describe a bit the project behind the data. It will give
some basic information about the raw data, how the original data were
obtained and what is behind these data. The next section will give an 
overview about the processes how the tidy dataset was created. The last
section is about the data in the tidy data set submitted on Coursera.

## Project description
This project was about collecting and working with data to create a tidy
dataset which can be used for further analysis. The data were related to
wearable computing collected from accelerometers from the Samsung Galaxy
S smartphone.

## Raw data

### Obtaining raw data
The raw data for the project was available on below link in zipped format:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
They were collected by accelerometer and gyroscope of the Samsung Galaxy
S smartphone.

### Some notes on raw data
Taken from the features_info file:
The features in the dataset come from the accelerometer and gyroscope 
3-axial raw signals. These time domain signals were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a 3rd order
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also 
the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Creating the tidy dataset
This section will give only basic information on creating the tidy dataset.
For more details, please read the README file.
First the data were downloaded from the link mentioned in section Obtaining
raw data and they were unzipped. The following files were then used for
further processing: X_test.txt, y_test.txt, subject_test.txt, X_train.txt, 
y_train.txt, subject_train.txt, features.txt. They were loaded into R.
I created 2 datasets, one from "test" files the other from "training"
files and then I combined these 2 datasets together to create one dataset.
For further analysis I needed the data which were the mean and standard
deviation of the measurements. Thus I created a subset containing only
these data. Next I changed the values in the Activity column. I replaced
the original integer values representing each activity with a character
string describing the activity. In the next step I changed the column
names to have them descriptive. I got rid of all special signs and
described all abbreviations. Finally in last step I created a new dataset
containing the average for each variable for each subject and activity.
For this I used the wide form, I grouped the data by subject and activity
and then I summarized with the mean function. For detailed description
of the code and how the tidy dataset was created please read the README.

## Tidy data
The tidy dataset has 180 rows(observations) and 68 columns(variables).
The variables of the dataset are the Subject - id of the subject doing the
test, Activity - description of the activity done by the subject and then
66 variables showing the average of that variable for the given subject 
and activity.
The class of the data is mostly numeric (for all that 66 columns containing
the average values), the class of variable Subject is integer and the class
of variable Activity is character (note in the original dataset it was
integer, however during processing when I changed them to be descriptive,
the class changed to character).
The units of the variables: the variables for Accelerometer are in standard
gravity units (g), the variables for Gyroscope are in radians/seconds.
The tidy dataset contains the below variables:
"Subject":
- the id of the subject who did the testing. Integer value within range 1:30.
"Activity"
- description of the activity done by the subject. Character value within
  a range of these 6 values:walking,walking_upstares,walking_downstares,
  sitting,standing,laying
"timeBodyAccelerometermeanX"
- the average value of the mean of time domain of body acceleration signal
  on the X axis
"timeBodyAccelerometermeanY"
- the average value of the mean of time domain of body acceleration signal
  on the Y axis
"timeBodyAccelerometermeanZ"
- the average value of the mean of time domain of body acceleration signal
  on the Z axis
"timeBodyAccelerometerstandarddeviationX"
- the average value of the standard deviation of time domain of body 
  acceleration signal on the X axis
"timeBodyAccelerometerstandarddeviationY"
- the average value of the standard deviation of time domain of body 
  acceleration signal on the Y axis
"timeBodyAccelerometerstandarddeviationZ"
- the average value of the standard deviation of time domain of body 
  acceleration signal on the Z axis
"timeGravityAccelerometermeanX"
- the average value of the mean of time domain of gravity acceleration
  signal on the X axis
"timeGravityAccelerometermeanY"
- the average value of the mean of time domain of gravity acceleration
  signal on the Y axis
"timeGravityAccelerometermeanZ"
- the average value of the mean of time domain of gravity acceleration
  signal on the Z axis
"timeGravityAccelerometerstandarddeviationX"
- the average value of the standard deviation of time domain of gravity 
  acceleration signal on the X axis
"timeGravityAccelerometerstandarddeviationY"
- the average value of the standard deviation of time domain of gravity 
  acceleration signal on the Y axis
"timeGravityAccelerometerstandarddeviationZ"
- the average value of the standard deviation of time domain of gravity 
  acceleration signal on the Z axis
"timeBodyAccelerometerJerkmeanX"
- the average value of the mean of time domain of jerk acceleration
  signal on the X axis
"timeBodyAccelerometerJerkmeanY"
- the average value of the mean of time domain of jerk acceleration
  signal on the Y axis
"timeBodyAccelerometerJerkmeanZ"
- the average value of the mean of time domain of jerk acceleration
  signal on the Z axis
"timeBodyAccelerometerJerkstandarddeviationX"
- the average value of the standard deviation of time domain of jerk 
  acceleration signal on the X axis
"timeBodyAccelerometerJerkstandarddeviationY"
- the average value of the standard deviation of time domain of jerk 
  acceleration signal on the Y axis
"timeBodyAccelerometerJerkstandarddeviationZ"
- the average value of the standard deviation of time domain of jerk 
  acceleration signal on the Z axis
"timeBodyGyroscopemeanX"
- the average value of the mean of time domain of body gyroscope signal
  on the X axis
"timeBodyGyroscopemeanY"
- the average value of the mean of time domain of body gyroscope signal
  on the Y axis
"timeBodyGyroscopemeanZ"
- the average value of the mean of time domain of body gyroscope signal
  on the Z axis
"timeBodyGyroscopestandarddeviationX"
- the average value of the standard deviation of time domain of body 
  gyroscope signal on the X axis
"timeBodyGyroscopestandarddeviationY"
- the average value of the standard deviation of time domain of body 
  gyroscope signal on the Y axis
"timeBodyGyroscopestandarddeviationZ"
- the average value of the standard deviation of time domain of body 
  gyroscope signal on the Z axis
"timeBodyGyroscopeJerkmeanX"
- the average value of the mean of time domain of jerk gyroscope
  signal on the X axis
"timeBodyGyroscopeJerkmeanY"
- the average value of the mean of time domain of jerk gyroscope
  signal on the Y axis
"timeBodyGyroscopeJerkmeanZ"
- the average value of the mean of time domain of jerk gyroscope
  signal on the Z axis
"timeBodyGyroscopeJerkstandarddeviationX"
- the average value of the standard deviation of time domain of jerk 
  gyroscope signal on the X axis
"timeBodyGyroscopeJerkstandarddeviationY"
- the average value of the standard deviation of time domain of jerk 
  gyroscope signal on the Y axis
"timeBodyGyroscopeJerkstandarddeviationZ"
- the average value of the standard deviation of time domain of jerk 
  gyroscope signal on the Z axis
"timeBodyAccelerometerMagnitudemean"
- the average value of the magnitude of mean of time domain of body 
  acceleration signal
"timeBodyAccelerometerMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of time 
  domain of body acceleration signal
"timeGravityAccelerometerMagnitudemean"
- the average value of the magnitude of mean of time domain of  
  gravity acceleration signal
"timeGravityAccelerometerMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of time domain
  of gravity acceleration signal
"timeBodyAccelerometerJerkMagnitudemean"
- the average value of the magnitude of mean of time domain of  
  jerk body acceleration signal
"timeBodyAccelerometerJerkMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of time 
  domain of jerk body acceleration signal
"timeBodyGyroscopeMagnitudemean"
- the average value of the magnitude of mean of time domain of body 
  gyroscope signal
"timeBodyGyroscopeMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of time 
  domain of body gyroscope signal
"timeBodyGyroscopeJerkMagnitudemean"
- the average value of the magnitude of mean of time domain of  
  jerk body gyroscope signal
"timeBodyGyroscopeJerkMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of time 
  domain of jerk body acceleration signal
"frequencyBodyAccelerometermeanX"
- the average value of the mean of frequency domain of body acceleration 
  signal on the X axis
"frequencyBodyAccelerometermeanY"
- the average value of the mean of frequency domain of body acceleration 
  signal on the Y axis
"frequencyBodyAccelerometermeanZ"
- the average value of the mean of frequency domain of body acceleration 
  signal on the Z axis
"frequencyBodyAccelerometerstandarddeviationX"
- the average value of the standard deviation of frequency domain of 
  body acceleration signal on the X axis
"frequencyBodyAccelerometerstandarddeviationY"
- the average value of the standard deviation of frequency domain of 
  body acceleration signal on the Y axis
"frequencyBodyAccelerometerstandarddeviationZ"
- the average value of the standard deviation of frequency domain of 
  body acceleration signal on the Z axis
"frequencyBodyAccelerometerJerkmeanX"
- the average value of the mean of frequency domain of jerk body acceleration
  signal on the X axis
"frequencyBodyAccelerometerJerkmeanY"
- the average value of the mean of frequency domain of jerk body acceleration
  signal on the Y axis
"frequencyBodyAccelerometerJerkmeanZ"
- the average value of the mean of frequency domain of jerk body acceleration
  signal on the Z axis
"frequencyBodyAccelerometerJerkstandarddeviationX"
- the average value of the standard deviation of frequency domain of jerk 
  body acceleration signal on the X axis
"frequencyBodyAccelerometerJerkstandarddeviationY"
- the average value of the standard deviation of frequency domain of jerk 
  body acceleration signal on the Y axis
"frequencyBodyAccelerometerJerkstandarddeviationZ"
- the average value of the standard deviation of frequency domain of jerk 
  body acceleration signal on the Z axis
"frequencyBodyGyroscopemeanX"
- the average value of the mean of frequency domain of body gyroscope 
  signal on the X axis
"frequencyBodyGyroscopemeanY"
- the average value of the mean of frequency domain of body gyroscope 
  signal on the Y axis
"frequencyBodyGyroscopemeanZ"
- the average value of the mean of frequency domain of body gyroscope 
  signal on the Z axis
"frequencyBodyGyroscopestandarddeviationX"
- the average value of the standard deviation of frequency domain of 
  body gyroscope signal on the X axis
"frequencyBodyGyroscopestandarddeviationY"
- the average value of the standard deviation of frequency domain of 
  body gyroscope signal on the Y axis
"frequencyBodyGyroscopestandarddeviationZ"
- the average value of the standard deviation of frequency domain of 
  body gyroscope signal on the Z axis
"frequencyBodyAccelerometerMagnitudemean"
- the average value of the magnitude of mean of frequency domain of body 
  acceleration signal
"frequencyBodyAccelerometerMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of frequency 
  domain of body acceleration signal
"frequencyBodyBodyAccelerometerJerkMagnitudemean"
- the average value of the magnitude of mean of frequency domain of body 
  jerk acceleration signal
"frequencyBodyBodyAccelerometerJerkMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of frequency 
  domain of body jerk acceleration signal
"frequencyBodyBodyGyroscopeMagnitudemean"
- the average value of the magnitude of mean of frequency domain of body 
  gyroscope signal
"frequencyBodyBodyGyroscopeMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of frequency 
  domain of body gyroscope signal
"frequencyBodyBodyGyroscopeJerkMagnitudemean"
- the average value of the magnitude of mean of frequency domain of body 
  jerk gyroscope signal
"frequencyBodyBodyGyroscopeJerkMagnitudestandarddeviation"
- the average value of the magnitude of standard deviation of frequency 
  domain of body jerk gyroscope signal
