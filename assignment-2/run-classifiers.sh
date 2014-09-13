#!/bin/bash
WEKA_JAR=/home/john/Documents/school/fau/2014-summer/performance-modeling/weka-3-6-11/weka.jar

DATA_FILE=/home/john/Documents/school/fau/2014-fall/data-mining/assignments/data-mining/assignment-1/Lymphoma96x4026.arff

PREFIX=/home/john/Documents/school/fau/2014-fall/data-mining/assignments/data-mining/assignment-2

CLASSIFIERS_FILE=$PREFIX/classifiers.txt
COST_MATRIX_FILE=$PREFIX/cost-matrices.txt
META_CLASSIFIERS_FILE=$PREFIX/meta-classifiers.txt

NUM_COST_MATRICES=$(wc -l < $COST_MATRIX_FILE)
NUM_CLASSIFIERS=$(wc -l < $CLASSIFIERS_FILE)
NUM_META_CLASSIFIERS=$(wc -l < $META_CLASSIFIERS_FILE)


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
for NUM_ITERATIONS in "10" "25"; do
let k=1;
while [ $k -le $NUM_META_CLASSIFIERS ]; do
	META_CLASSIFIER="$(sed $k'q;d' $META_CLASSIFIERS_FILE)"
	let i=1;
		while [  $i -le $NUM_CLASSIFIERS ];	do
			CLASSIFIER="$(sed $i'q;d' classifiers.txt)";
			let j=1;
			while [  $j -le $NUM_COST_MATRICES ];	do
				COST_MATRIX=$(sed $j'q;d' cost-matrices.txt);
				OUTPUT_FILE=$(echo $META_CLASSIFIER | sed 's/;//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/ /_/g' | sed 's/"//g')
				OUTPUT_FILE=$(echo $OUTPUT_FILE)$(echo $COST_MATRIX | sed 's/;//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/ /_/g' | sed 's/"//g')
				OUTPUT_FILE=$(echo $OUTPUT_FILE)$(echo $CLASSIFIER | sed 's/ //g' | sed 's/[-]\+/_/g');
				echo $OUTPUT_FILE;
				java -cp  $WEKA_JAR $META_CLASSIFIER $NUM_ITERATIONS -t $DATA_FILE -W weka.classifiers.meta.CostSensitiveClassifier -- -cost-matrix "$COST_MATRIX" -S 1 $CLASSIFIER > $OUTPUT_FILE
				let j=j+1;
			done
			let i=i+1;
		done
		let k=k+1;
	done
done
