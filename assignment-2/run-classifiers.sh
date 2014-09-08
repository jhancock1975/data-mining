#!/bin/bash
WEKA_JAR=/home/john/Documents/school/fau/2014-summer/performance-modeling/weka-3-6-11/weka.jar

DATA_FILE=/home/john/Documents/school/fau/2014-fall/data-mining/assignments/data-mining/assignment-1/Lymphoma96x4026.arff

PREFIX=/home/john/Documents/school/fau/2014-fall/data-mining/assignments/data-mining/assignment-2

CLASSIFIERS_FILE=$PREFIX/classifiers.txt

COST_MATRIX_FILE=$PREFIX/cost-matrices.txt

NUM_COST_MATRICES=$(wc -l < $COST_MATRIX_FILE)
NUM_CLASSIFIERS=$(wc -l < $CLASSIFIERS_FILE)

# I had to use a while loop with
# this complicated way to read
# matrices out of a file because 
# characters such as ';' in matlab
# matrix format pose difficulties in
# strings in bash scripts.
# For example, if we say
# for var in $(cat $COST_MATRIX_FILE)...
# we get two value of the iterator for
# each line in COST_MATRIX_FILE because
# of the ';' caracters.
# Similar reason for doing the same thing
# with classifiers.

let i=1;
while [  $i -le $NUM_CLASSIFIERS ];	do
	CLASSIFIER=$(sed $i'q;d' classifiers.txt);
	let j=1;
	echo classifier = $CLASSIFIER
	while [  $j -le $NUM_COST_MATRICES ];	do
		echo COST_MATRIX = $COST_MATRIX
		COST_MATRIX=$(sed $j'q;d' cost-matrices.txt);
		java -cp  $WEKA_JAR weka.classifiers.meta.CostSensitiveClassifier  -t $DATA_FILE  -i -cost-matrix "$COST_MATRIX" -S 1 -W $CLASSIFIER
		let j=j+1;
	done
	let i=i+1;
done
