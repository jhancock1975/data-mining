#!/bin/bash
pushd .
PLOT_MID=$(pwd)/plot-middle.txt
PLOT_END=$(pwd)/plot-end.txt
PLOT_PRE=$(pwd)/plot-prefix.txt
cd saved-output
for dir in ./*/; do 
	pushd .
	cd $dir
	DIR_NAME=$(echo $dir | sed 's/\///g' | sed 's/\.//g')
	PLOT_CMD_FILE=$(echo $DIR_NAME.gplt)
	FP_FILE=$(ls *fp*sorted)
	FN_FILE=$(ls *fn*sorted)
	cat $PLOT_PRE >> $PLOT_CMD_FILE
	printf " "\'$FP_FILE\'" " >> $PLOT_CMD_FILE
	cat $PLOT_MID >> $PLOT_CMD_FILE
	printf " "\'$FN_FILE\'" " >> $PLOT_CMD_FILE
	cat $PLOT_END >> $PLOT_CMD_FILE
	popd
	done;
popd
