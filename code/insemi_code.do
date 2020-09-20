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

