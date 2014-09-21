for fileName in $(ls *--*); do
	echo 'data=read.csv("'$fileName'", sep=" ", header=FALSE); summary(aov(lm(data[["V2"]] ~ data[["V1"]]*data[["V3"]])))  ' | R --no-save
	done
