#!/bin/bash
pushd .
cd saved-output
for dir in ./*/; do 
	pushd .
	cd $dir
	DIR_NAME=$(echo $dir | sed 's/\///g' | sed 's/\.//g')
	PLOT_CMD_FILE=$(echo $DIR_NAME.gplt)
	FP_FILE=$(ls *fp*dat)
	FN_FILE=$(ls *fn*dat)
	for FILE_NAME in "$FP_FILE" "$FN_FILE"; do
		cat $FILE_NAME | sort -g > $FILE_NAME.sorted
		done;
	popd
	done;
popd
