/*

DO-FILE FOR OKAMURO SEMINAR JUNIOR PROJECT

*/


* ########################### CREATION OF THE MAIN DATASET BEGIN ########################### *


* preamble
* delate all stored data
clear all

* close log file if any open
capture log close

* path to the working directory
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/csv/for_analysis"

* create a new log file
log using stataoutput, replace

/*
* import csv file
import delimited foreign_raw.csv

* create new dummy varables for quarters
gen q2 = 0
gen q3 = 0
gen q4 = 0

replace q2 = 1 if quarter == 2
replace q3 = 1 if quarter == 3
replace q4 = 1 if quarter == 4

* creater a new dummy variable for cashless-point refund project
gen project = 0
replace project = 1 if quarter == 4 & year == 2019
replace project = 1 if quarter == 1 & year == 2020

* create a new variable for time index
gen time_id = 0
replace time_id = 1 if quarter == 2 & year == 2018
replace time_id = 2 if quarter == 3 & year == 2018
replace time_id = 3 if quarter == 4 & year == 2018
replace time_id = 4 if quarter == 1 & year == 2019
replace time_id = 5 if quarter == 2 & year == 2019
replace time_id = 6 if quarter == 3 & year == 2019
replace time_id = 7 if quarter == 4 & year == 2019
replace time_id = 8 if quarter == 1 & year == 2020

* create a new variable for prefecture id
egen pref_id = group(pref)


* commanted command below
/*
save main
*/

*/
* ########################### CREATION OF THE MAIN DATASET END ########################### *


/*
ANALYSIS 1: foreign, without quarter dummy, until 2019 4Q (table 1 & 2)
ANALYSIS 2: foreign, without quarter dummy, until 2020 1Q (table 3 & 4)
ANALYSIS 3: foreign, with quarter dummy, until 2019 4Q (table 5 & 6)
ANALYSIS 4: foreign, with quarter dummy, until 2020 1Q (table 7 & 8)
ANALYSIS 5: domestic, cpc_stay_tourism, with quarter dummy, until 20201Q
ANALYSIS 6: domestic, cpc_day_tourism, with quarter dummy, until 20201Q
*/


* ########################### ANALYSIS 1 START ########################### *
clear all 
use main
outreg2 using stat0.tex, replace sum(log)

* save the main dataset as main.dta
keep if item == "Group Package" & year != 2020

* set the dataset as a panel data
xtset pref_id time_id

* regression analysis
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table1.tex, replace

outreg2 using stat1.tex, replace sum(log)


* clear all data in memory
clear all
* load main dataset
use main
keep if item == "Individual Package" & year != 2020
outreg2 using stat2.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table1.tex, append

clear all
use main
keep if item == "Rouund-trip Air / Ship" & year != 2020
outreg2 using stat3.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table1.tex, append

clear all
use main
keep if item == "Accommodation" & year != 2020
outreg2 using stat4.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, replace

clear all
use main
keep if item == "Food" & year != 2020
outreg2 using stat5.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Transportation - Overall" & year != 2020
outreg2 using stat6.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Transportation - Train" & year != 2020
outreg2 using stat7.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Transportation - Bus/Taxi" & year != 2020
outreg2 using stat8.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Transportation - Others" & year != 2020
outreg2 using stat9.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Leisure" & year != 2020
outreg2 using stat10.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Shopping" & year != 2020
outreg2 using stat11.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append

clear all
use main
keep if item == "Others" & year != 2020
outreg2 using stat12.tex, replace sum(log)
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table2.tex, append
* ########################### ANALYSIS 1 END ########################### *


* ########################### ANALYSIS 2 START ########################### *
clear all 
use main

* save the main dataset as main.dta
keep if item == "Group Package"

* set the dataset as a panel data
xtset pref_id time_id

* regression analysis
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table3.tex, replace


* clear all data in memory
clear all
* load main dataset
use main
keep if item == "Individual Package"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table3.tex, append

clear all
use main
keep if item == "Individual Package"
reghdfe consumption project, absorb(pref_id)


clear all
use main
keep if item == "Rouund-trip Air / Ship"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table3.tex, append

clear all
use main
keep if item == "Accommodation"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, replace

clear all
use main
keep if item == "Food"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Transportation - Overall"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Transportation - Train"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Transportation - Bus/Taxi"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Transportation - Others"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Leisure"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Shopping"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append

clear all
use main
keep if item == "Others"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)
outreg2 using table4.tex, append
* ########################### ANALYSIS 2 END ########################### *

* ########################### ANALYSIS 3 START ########################### *
clear all
use main
keep if item == "Group Package" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table5.tex, replace

clear all
use main
keep if item == "Individual Package" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table5.tex, append

clear all
use main
keep if item == "Rouund-trip Air / Ship" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table5.tex, append

clear all
use main
keep if item == "Accommodation" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, replace

clear all
use main
keep if item == "Food" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Transportation - Overall" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Transportation - Train" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Transportation - Bus/Taxi" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Transportation - Others" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Leisure" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Shopping" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append

clear all
use main
keep if item == "Others" & year != 2020
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table6.tex, append
* ########################### ANALYSIS 3 END ########################### *

* ########################### ANALYSIS 4 START ########################### *
clear all
use main
keep if item == "Group Package"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table7.tex, replace

clear all
use main
keep if item == "Individual Package"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table7.tex, append

clear all
use main
keep if item == "Rouund-trip Air / Ship"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table7.tex, append

clear all
use main
keep if item == "Accommodation"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, replace

clear all
use main
keep if item == "Food"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Overall"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Train"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Bus/Taxi"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Others"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Leisure"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Shopping"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Others"
xtset pref_id time_id
xtreg consumption project q2 q3 q4, fe vce(cluster pref_id)
outreg2 using table8.tex, append
* ########################### ANALYSIS 4 END ########################### *


/*
clear all
use main_domestic

* create a new variable for prefecture id
egen pref_id = group(pref)

* create a new variable for time index
gen time_id = 0
replace time_id = 1 if quarter == 2 & year == 2018
replace time_id = 2 if quarter == 3 & year == 2018
replace time_id = 3 if quarter == 4 & year == 2018
replace time_id = 4 if quarter == 1 & year == 2019
replace time_id = 5 if quarter == 2 & year == 2019
replace time_id = 6 if quarter == 3 & year == 2019
replace time_id = 7 if quarter == 4 & year == 2019
replace time_id = 8 if quarter == 1 & year == 2020

save main_domestic

*/

/*
* create new dummy varables for quarters
gen q2 = 0
gen q3 = 0
gen q4 = 0

replace q2 = 1 if quarter == 2
replace q3 = 1 if quarter == 3
replace q4 = 1 if quarter == 4

save main_domestic
*/

/*
* creater a new dummy variable for cashless-point refund project
gen project = 0
replace project = 1 if quarter == 4 & year == 2019
replace project = 1 if quarter == 1 & year == 2020


save main_domestic
*/


* ########################### ANALYSIS 5 START ########################### *
* 単位を変える必要がある？全くもって有意にならない。
clear all
use main_domestic
xtset pref_id time_id
xtreg cpc_stay_tourism project q2 q3 q4, fe vce(cluster pref_id)
xtreg cpc_day_tourism project q2 q3 q4, fe vce(cluster pref_id)

drop if year == 2020

xtset pref_id time_id
xtreg cpc_stay_tourism project q2 q3 q4, fe vce(cluster pref_id)
xtreg cpc_day_tourism project q2 q3 q4, fe vce(cluster pref_id)

* ########################### ANALYSIS 5 END ########################### *

* ########################### ANALYSIS 6 START ########################### *

clear all
use main2


* ########################### ANALYSIS 6 END ########################### *

clear all
use main

gen cashless_rate = 0
replace cashless_rate = 24.1 if year == 2018
replace cashless_rate = 25.7642 if year == 2019
replace cashless_rate = 28.038 if year == 2020

gen kousa = 0
replace kousa = cashless_rate * project

save main

clear all
use main
keep if item == "Group Package"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table7.tex, replace

clear all
use main
keep if item == "Individual Package"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table7.tex, append

clear all
use main
keep if item == "Rouund-trip Air / Ship"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table7.tex, append

clear all
use main
keep if item == "Accommodation"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, replace

clear all
use main
keep if item == "Food"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Overall"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Train"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Bus/Taxi"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Transportation - Others"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Leisure"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Shopping"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append

clear all
use main
keep if item == "Others"
xtset pref_id time_id
xtreg consumption project q2 q3 q4 cashless_rate kousa, fe vce(cluster pref_id)
outreg2 using table8.tex, append















clear all
capture log close
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/code/data_new"
use foreign

reshape long 


use foreign_wide














