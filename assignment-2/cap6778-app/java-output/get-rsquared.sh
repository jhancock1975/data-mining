for className in "Boosting-J48-" "Bagging-J48-" "Boosting-Decision-Stump-" "Bagging-Decision-Stump-"; do
	for numIts in 10 25; do
			cd $className$numIts
			echo $className$numIts $fileName fpr
			echo 'data=read.csv("./fpr.dat", sep=" ", header=FALSE); summary(lm(data[["V2"]] ~ data[["V1"]]))  ' | R --no-save | grep R-squared | awk '{print $3}'	
			echo $className$numIts $fileName fnr
			echo 'data=read.csv("./fnr.dat", sep=" ", header=FALSE); summary(lm(data[["V2"]] ~ data[["V1"]]))  ' | R --no-save | grep R-squared | awk '{print $3}'	
			cd ..
	done
done
