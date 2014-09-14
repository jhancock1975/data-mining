mkdir bagging-decis-stump-10
mkdir bagging-decis-stump-25
mkdir bagging-j48-10
mkdir bagging-j48-25
mkdir boosting-decis-stump-10
mkdir boosting-decis-stump-25
mkdir boosting-j48-10
mkdir boosting-j48-25
mv weka.classifiers.meta.AdaBoostM1_-i_-P_100_-S_1_-I_25_0.0_*DecisionStump ./boosting-decis-stump-25/
mv weka.classifiers.meta.AdaBoostM1_-i_-P_100_-S_1_-I_25_0.0_*DecisionStump ./boosting-decis-stump-25/
mv weka.classifiers.meta.AdaBoostM1_-i_-P_100_-S_1_-I_10_0.0_*J48* ./boosting-j48-10/
mv weka.classifiers.meta.AdaBoostM1_-i_-P_100_-S_1_-I_25_0.0_*J48* ./boosting-j48-25/
mv weka.classifiers.meta.Bagging_-i_-P_100_-S_1_-I_10*Decision* ./bagging-decis-stump-10
mv weka.classifiers.meta.Bagging_-i_-P_100_-S_1_-I_25*J48* ./bagging-j48-25/
mv weka.classifiers.meta.Bagging_-i_-P_100_-S_1_-I_10*J48* ./bagging-j48-10/
mv weka.classifiers.meta.Bagging_-i_-P_100_-S_1_-I_25_0.0_*Decis ./bagging-decis-stump-25/
mv weka.classifiers.meta.Bagging_-i_-P_100_-S_1_-I_25_0.0_*Decis* ./bagging-decis-stump-25/
