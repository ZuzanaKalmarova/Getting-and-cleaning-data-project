# Getting-and-cleaning-data-project

## Purpose of this file
The purpose of this README file is to explain how the code run_analysis
works, how it creates the tidy data set and how it meets the requirements
of the assignment. The details about the raw and tidy data itself can be
found in the Codebook.md file.

## Requirements to run the code
This code requires in addition to basic packages also package dplyr. It
can be installed by command: install.packages("dplyr"). The run_analysis
code does not contain this command, thus if you don't have the package
installed yet, please install before running the code. The code loads the
library if it is installed, you don't need to load it before running the
code.
To run the code, you need to have the files saved directly in your working
directory, already unzipped. The code does not include commands for 
downloading and unzipping the files, because in requirements it is stated
that the code should be possible to run as long as the files are in the
reviewers working directory. You need the following 7 files to run my code:
X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, 
subject_train.txt, features.txt

## Description of the code

### First requirement
After downloading and unzipping the files (the code does not contain
these steps) I have read the README file and checked the files to see
what data they contain and to decide which files I need. I understood
there are 2 sets of data, the test set and the training set. Each set is
made from 3 files, one contains the subject id, one the activity ids and
one the measured observations. Thus first I decided to create one test 
dataset from the 3 test files and one training dataset from the 3 training
files. I used command cbind and put the subject id as first column,
activity id as second column and then the measurements from the 3rd file.
This way I created 2 datasets each with 563 columns. Then I combined these
2 datasets to one dataset using rbind putting the train observations(rows)
below the test observations. This way I created a dataset with 10299 
observations and 563 variables. The columns of this dataset had no names.
To facilitate my work for the next requirements, I named the columns. For
this I used the features file, to make the naming easy. I've read in this
file and subset the second column, which contains the feature names and
stored it as a character vector. This character vector thus contained the
names of the 561 measurements, but of course I needed to name the first
2 columns as well, thus I created a character vector of Subject, Activity
and the previously created character vector from features. I used this
new character vector as column names.

### Second requirement
As next requirement I needed only those measurements which were mean or 
standard deviation. I created this subdataset in 2 steps. First I subset
columns which contain in their names mean or std and of course the first 2
columns (Subject and Activity). To get the columns containing mean or std
I used command grep on my previously created character vector which I used
for column names. Grep returned a numeric vector showing the number of 
column which contains mean or std in its description. Thus I could combine
this together with 1 and 2 (columns Subject and Activity) and do a subset
based on column numbers in one step. In next step I wanted to get rid of
meanFreq, which is not a real mean. For this I used command select to keep
all columns except those, which contains meanFreq. This way I ended up with
dataset with 10299 observations and 68 variables.

### Third requirement
As next requirement I needed to use descriptive names for activity codes.
For this I used gsub command to substitute the numbers by descriptive
names as they are described in the activity labels file. As there were
only 6 activities, I decided not to load in the activity labels file and
also I did not create a for substitution, as I believe for this 6 type of 
activities the code is readable just by using the gsub command 6 times. 
Of course if there were more types of activities, I would read in the
activity label file, store the values and create a for loop with gsub for
substitution. But for this case I did not find it necessary.

### Fourth requirement
The next requirement was to use descriptive variable names. I saw on the
forum several discussions about whether to use lowercase only or camelCase.
I believe camelCase is more readable, thus except the words mean and standard
deviation I used camelCase. To have the variable names descriptive, first
I got rid of special characters as - and (). Then I described/explained the
abbreviations. I used gsub command for the replacements.

### Fifth requirement
The final requirement was to create a new dataset calculating the average of
each variable for each subject and activity. To achieve this, I grouped my
tidy dataset from previous steps by Subject and Activity and then used the 
summarise_each command with mean function to get an average for each subject
and activity (30*60=180) and this for each measurement/variable. I used the 
wide form of tidy data set, which has 180 rows (as computed above) and
68 columns (the subject, activity and the 66 measurement/variables). I like
the chain (%>%), which makes the code really readable, you don't have to
store the result of each step in separate variable, the code just takes the
value from previous step. So I used this to put together my grouping
(group_by) and summarizing (summarise_each)

### The final steps
In the last line of my code there is a View command. If you run the code in
RStudio, it will give you a clear, nicely shaped view of the final dataset.
After creating the final dataset, I used write.table command to create a 
text file, which I uploaded on Coursera. You need to use read.table command
with header=TRUE to read the file in R. I did not include the write.table
in my code, not to create a file on your computer if you don't wish or if
you already downloaded checking in first step of evaluation.