#!/bin/bash
pushd .
cd saved-output
for dir in ./*/; do 
	pushd .
	cd $dir
	DIR_NAME=$(echo $dir | sed 's/\///g' | sed 's/\.//g')
	FP_DATA_POINTS=$(echo $DIR_NAME-fp-data-points.dat)
	FN_DATA_POINTS=$(echo $DIR_NAME-fn-data-points.dat)
	for FILE_NAME in $(ls weka*); do
		X_VALUE=$(echo $FILE_NAME | awk -F '_' '{print $10}')
		FP_RATE=$(grep -A 3 'FP Rate' $FILE_NAME | tail -n 3 | head -n 2 | awk '{print $2}' | head -n 1 | sed "s/^/$X_VALUE /")
		FN_RATE=$(grep -A 3 'FP Rate' $FILE_NAME | tail -n 3 | head -n 2 | awk '{print $2}' | tail -n 1 | sed "s/^/$X_VALUE /")
		echo  $FP_RATE >> $FP_DATA_POINTS
		echo  $FN_RATE >> $FN_DATA_POINTS
	done;
	popd
done;
popd
