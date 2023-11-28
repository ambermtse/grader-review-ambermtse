
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if ! test -f student-submission/ListExamples.java
    then echo "ListExamples.java file not found"
    exit
fi

cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area
cd grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples 

if ! test $? -eq 0 
then echo "Not all tests passed"
else echo "All tests passed"
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
