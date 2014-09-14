#!/bin/bash
rm -f $(find . -name "*gplt")
pushd .
cd saved-output
for dir in ./*/; do 
	pushd .
	cd $dir
	DIR_NAME=$(echo $dir | sed 's/\///g' | sed 's/\.//g')
	PLOT_CMD_FILE=$(echo $DIR_NAME.gplt)
	FP_FILE=$(ls *fp*sorted)
	FN_FILE=$(ls *fn*sorted)
	printf "set term postscript eps 22\n" >> $PLOT_CMD_FILE
	printf "set key center top\n" >> $PLOT_CMD_FILE
	printf "set xlabel 'Type II Error Cost'\n" >> $PLOT_CMD_FILE
	printf "set ylabel 'Missclassifications'\n" >> $PLOT_CMD_FILE
	printf "set linestyle 1 lt 2 lw 3\n" >> $PLOT_CMD_FILE
	printf "set logscale x\n" >> $PLOT_CMD_FILE
	printf "#set xrange [0.1:300]\n" >> $PLOT_CMD_FILE
	printf "set key box linestyle 1 \n" >> $PLOT_CMD_FILE # dashed lines around box	
	printf "set output '"$DIR_NAME".ps'\n" >> $PLOT_CMD_FILE # have to do every time
	printf "plot " >> $PLOT_CMD_FILE
	printf " "\'$FP_FILE\'" " >> $PLOT_CMD_FILE
	HEADER=$(echo $dir | sed 's/\///g' | sed 's/\.//g' )
	HEADER=${HEADER^^}
	printf "title '"$HEADER" FPR ' with linespoints lw 3 pt 4, " >> $PLOT_CMD_FILE
	printf "\'$FN_FILE\' "  >> $PLOT_CMD_FILE
	printf "title '"$HEADER" FNR' with linespoints lw 3 pt 8\n" >> $PLOT_CMD_FILE
	gnuplot < $PLOT_CMD_FILE
	popd
	done;
popd
