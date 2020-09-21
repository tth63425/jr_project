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


* extract group packege data
keep if item == "Food"
xtset pref_id time_id
xtreg consumption project, fe vce(cluster pref_id) 



