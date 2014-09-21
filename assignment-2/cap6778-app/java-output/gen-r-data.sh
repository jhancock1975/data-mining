rm *--*dat
for className in "Boosting-J48-" "Bagging-J48-" "Boosting-Decision-Stump-" "Bagging-Decision-Stump-"; do
	for numIts in "10" "25"; do
		for fileName in "fpr.dat" "fnr.dat"; do
			if [ $numIts == "10" ] 
			then
				numItsCat=ten
				else
				numItsCat=twentyFive
			fi
			cat $className$numIts/$fileName | sed "s/$/ $numItsCat/g" >> $className-$fileName
		done
	done
done
