CODEBOOK

data1.txt dataset

This dataset has been retrieved from the data collected from the accelerometers from the Samsung Galaxy S smartphone. Having cleared some of it before. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Variables Description DECODIFICATION (For data1.txt columnnames except Suj, Actn and Acts)

*'XYZ' is used to denote 3-axial signals in the X, Y and Z directions. *'t' is used to denote time domain signals *'f' is used to denote frequency domain signals *'acc' acceleration signal from the smartphone accelerometer *'meanFreq' is the weighted average of the frequency components to obtain a mean frequency *'angle' Angle between to vectors. *'Gyr' angular velocity from the smartphone gyroscope. *'Body' the signals related to the body of the individual being examinated. *'Jerk' Jerk Signals *'Mag' magnitude of the three-dimensional signals calculated using the Euclidean norm *'Gravity' the rignals related to the gravity *'Subj' numer from 1 to 30 that identifies the individual who carried the experiment *'Acts' STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS. *'Actn' numerical code refering to the activities from 'Acts' *'mean' refers to the mean of mean values presented in the original dataset *'std' refers to the mean of standard deviations presented in the original dataset

Data and transformation

The information in the presented dataset refers to the average of the given variables. Thus it might mean diferent things.

For obtaining such information the next steps were followed *Download and reading of files x,y,subject for test and train; as well as activity labels and features. Assumptions the order of the files x,y and subjects is consistent transversally (each row refers to the same subject test-activity combination). 2nd.- the order for the columns in the x files is the same as the one in the Features file. *Merging of information, using Features as column names, and joining y, y decodification (Activity names) and subject as columns. Assumptions the orders are consistent, and the subject numbers are not repeated between the test and train sets. *Subsetting the variables that had measurements on mean and standard deviation Assumption the features that include "mean" and "std" are such measurements *Creation of a dataset with the average of each variable for each activity and each subject Detail For this the functions melt, aggregate and dcast were used to facilitate the calculation.

Notes and clarifications

The information here will include at least 2 degrees of freedom, as it is an average of either averages or standard deviations.
The file with the program is included in the github repository for replication https://github.com/AnaCG/GCDPeerReviewAssignment .
Thank you for your time.
References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.