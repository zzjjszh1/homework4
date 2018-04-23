# Clean Data For  Samsung Galaxy S 

> This is the homework of coursera data,criterias as below:
1. The submitted data set is tidy.
1. The Github repo contains the required scripts.
1. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
1. The README that explains the analysis files is clear and understandable.
1. The work submitted for this project is the work of the student who submitted it.

## Working Directory Structure

- UCI_HAR_Dataset

 As you see in github repo, there is a sub directory named UCI_HAR_Dataset, that's the original data matiral downloaded and unziped from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

- run_analysis.R

 This file contains all the code needed to generate data set , which includes :

   - **tidyexperimentdata.csv:** That's the file combines test and training data together , and subset only the mean and standard deviation for each measurement with appropriate label of each variable. Besides, subject num and activity names are append as a new column also
   - **averageby_subject_activity.csv:** That's the independent tidy data set with the average of each variable for each activity and each subject
   - **resultreqested.tab:** That's another version of the same data with averageby_subject_activity.csv, ajust according to the course request

  **Notice** :If you want to run the code on your computer, you should contain UCI_HAR_Dataset directory in which original data lies and also remember to create result directory mannally before launch the programm.

## Tidy data direcotry

In `./result` directory, there are three files described in the previous section, and `codebook.txt` describes the field of the data in that directory 

## License:


This dataset is under license of the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
