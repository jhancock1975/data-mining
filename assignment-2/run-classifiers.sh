#!/bin/bash
WEKA_JAR=/home/john/Documents/school/fau/2014-summer/performance-modeling/weka-3-6-11/weka.jar
DATA_FILE=/home/john/Documents/school/fau/2014-fall/data-mining/assignments/data-mining/assignment-1/Lymphoma96x4026.arff
CLASSIFIER="weka.classifiers.meta.Bagging -- -P 100 -S 1 -I 10 -W weka.classifiers.trees.J48 -- -C 0.25 -M 2"
COST_MATRIX="[0.0 1.0; 1.0 0.0]"
java -cp  $WEKA_JAR weka.classifiers.meta.CostSensitiveClassifier  -t $DATA_FILE  -i -cost-matrix "$COST_MATRIX" -S 1 -W $CLASSIFIER


