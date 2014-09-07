#!/bin/bash
WEKA_JAR=/home/john/Documents/school/summer-2014/performance-modeling/weka-3-6-11/weka.jar
DATA_FILE=/home/john/Documents/school/fall-2014/data-mining/assignments/assignment-1/Lymphoma96x4026.arff
CLASSIFIER="weka.classifiers.trees.J48 -- -C 0.25 -M 2"
COST_MATRIX="[0.0 22.5; 1.0 0.0]"
java -cp  $WEKA_JAR weka.classifiers.meta.CostSensitiveClassifier -x 10 -t $DATA_FILE  -i -cost-matrix "$COST_MATRIX" -S 1 -W $CLASSIFIER


