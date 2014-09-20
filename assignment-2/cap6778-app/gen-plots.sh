for plotFile in $(cat plot-files.txt); do
	cat $plotFile | sed 's/\/home\/john\/Documents\/school\/fau\/2014-fall\/data-mining\/assignments\/data-mining\/assignment-2\/cap6778-app/./g' | sed 's/Type II Error Cost/Type II Error to Type I Error Cost Ratio/g' | gnuplot
done;
