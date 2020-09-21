/*

DO-FILE FOR OKAMURO SEMINAR JUNIOR PROJECT

*/

* delate all stored data
clear all

* close log file if any open
capture log close

* path to the working directory
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/csv/for_analysis"

* create a new log file
log using stataoutput, replace

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

* save the main dataset as main.dta
save main

keep if item == "Group Package"

* set the dataset as a panel data
xtset pref_id time_id

* regression analysis
xtreg consumption project, fe vce(cluster pref_id)


* clear all data in memory
clear all
* load main dataset
use main
keep if item == "Individual Package"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Accommodation"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Food"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Transportation - Overall"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Transportation - Train"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Transportation - Bus/Taxi"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Transportation - Others"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Leisure"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Shopping"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

clear all
use main
keep if item == "Others"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id)

