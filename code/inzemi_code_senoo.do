* preamble
* delate all stored data
clear all

* close log file if any open
capture log close

* path to the working directory
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/csv/for_analysis"

* create a new log file
log using stataoutput, replace

use ketsugou_insemi


* ########################### CREATION OF THE MAIN DATASET BEGIN ########################### *
* create a new variable for time index
generate time_id =0
replace time_id = 1 if year==2018&quarter==2
replace time_id = 2 if year==2018&quarter==3
replace time_id = 3 if year==2018&quarter==4
replace time_id = 4 if year==2019&quarter==1
replace time_id = 5 if year==2019&quarter==2
replace time_id = 6 if year==2019&quarter==3
replace time_id = 7 if year==2019&quarter==4
replace time_id = 8 if year==2020&quarter==1
* create new dummy varables for quarters
generate q2=0
generate q3=0
generate q4=0
replace q2=1 if quarter==2
replace q3=1 if quarter==3
replace q4=1 if quarter==4
* create a new variable for prefecture id
egen pref_id=group(pref)
* creater a new dummy variable for cashless-point refund project
generate project=0
replace project=1 if year==2019&quarter==4
replace project=1 if year==2020&quarter==1
save newmain
* ########################### CREATION OF THE MAIN DATASET END ########################### *
/*
ANALYSIS 1: until 2020 1Q 
ANALYSIS 2: until 2019 4Q 
*/
* ########################### ANALYSIS 1 START ########################### *
/*clear all
use newmain
xtset pref_id time_id
xtreg consumption_stay_tourism  q2 q3 q4 project#foreign , fe vce(cluster pref_id) 
*/





clear all
use newmain

* idの割り振り直し
egen id = group(pref_id foreign)

gen cross_term = 0
replace cross_term = 1 if project == 1 & foreign == 1

*** 主体ごとの固定効果なし ***
reg consumption_stay_tourism cross_term project
outreg2 using did1.tex, replace
* 一行上の分析と本質的に同じ（結果を足し引きする）
* 四半期ダミーを入れる
reg consumption_stay_tourism cross_term project q2 q3 q4
outreg2 using did1.tex, append

*** 固定効果を入れる ***
* パネルデータ定義
xtset id time_id
* これも1行上と実質的に同じ
xtreg consumption_stay_tourism cross_term project foreign, fe vce(cluster id)
* 四半期ダミー
xtreg consumption_stay_tourism cross_term project q2 q3 q4, fe vce(cluster id)












xtset pref_id time_id

reghdfe consumption_stay_tourism q2 q3 q4 project#foreign, absorb(pref year)
xtreg consumption_stay_tourism  q2 q3 q4 project#foreign , fe vce(cluster pref_id) 
outreg2 using table10.tex, append
* ########################### ANALYSIS 1 END ########################### *
* ########################### ANALYSIS 2 START ########################### *
clear all
use newmain
drop if year==2020&quarter==1
xtset pref_id 
xtreg consumption_stay_tourism  q2 q3 q4 project#foreign , fe vce(cluster pref_id) 
outreg2 using table11.tex, append
* ########################### ANALYSIS 2 END ########################### *

keep if pref == "Aichi"
