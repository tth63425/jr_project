clear all
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver"
use "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver/zoukaritsu.dta"

reg consumption_stay_tourism cross_term project foreign
reg consumption_stay_tourism cross_term project foreign q2 q3 q4

tabulate pref_id, generate (pref_id_dummy)

gen logcon = log(consumption_stay_tourism)

hist consumption_stay_tourism
graph export c_hist_all.png
hist consumption_stay_tourism if foreign == 1
graph export c_hist_foreign.png
hist consumption_stay_tourism if foreign == 0
graph export c_hist_japanese.png

hist logcon
graph export log_hist_all.png
hist logcon if foreign == 1
graph export log_hist_foreign.png
hist logcon if foreign == 0
graph export log_hist_japan.png


gen cross_term_forepref1=0
gen cross_term_forepref2=0
gen cross_term_forepref3=0
gen cross_term_forepref4=0
gen cross_term_forepref5=0
gen cross_term_forepref6=0
gen cross_term_forepref7=0
gen cross_term_forepref8=0
gen cross_term_forepref9=0
gen cross_term_forepref10=0
gen cross_term_forepref11=0
gen cross_term_forepref12=0
gen cross_term_forepref13=0
gen cross_term_forepref14=0
gen cross_term_forepref15=0
gen cross_term_forepref16=0
gen cross_term_forepref17=0
gen cross_term_forepref18=0
gen cross_term_forepref19=0
gen cross_term_forepref20=0
gen cross_term_forepref21=0
gen cross_term_forepref22=0
gen cross_term_forepref23=0
gen cross_term_forepref24=0
gen cross_term_forepref25=0
gen cross_term_forepref26=0
gen cross_term_forepref27=0
gen cross_term_forepref28=0
gen cross_term_forepref29=0
gen cross_term_forepref30=0
gen cross_term_forepref31=0
gen cross_term_forepref32=0
gen cross_term_forepref33=0
gen cross_term_forepref34=0
gen cross_term_forepref35=0
gen cross_term_forepref36=0
gen cross_term_forepref37=0
gen cross_term_forepref38=0
gen cross_term_forepref39=0
gen cross_term_forepref40=0
gen cross_term_forepref41=0
gen cross_term_forepref42=0
gen cross_term_forepref43=0
gen cross_term_forepref44=0
gen cross_term_forepref45=0
gen cross_term_forepref46=0
gen cross_term_forepref47=0

replace cross_term_forepref1 = 1 if foreign == 1 &   pref_id_dummy1 == 1
replace cross_term_forepref2 = 1 if foreign == 1 &   pref_id_dummy2 == 1
replace cross_term_forepref3 = 1 if foreign == 1 &   pref_id_dummy3 == 1
replace cross_term_forepref4 = 1 if foreign == 1 &   pref_id_dummy4 == 1
replace cross_term_forepref5 = 1 if foreign == 1 &   pref_id_dummy5 == 1
replace cross_term_forepref6 = 1 if foreign == 1 &   pref_id_dummy6 == 1
replace cross_term_forepref7 = 1 if foreign == 1 &   pref_id_dummy7 == 1
replace cross_term_forepref8 = 1 if foreign == 1 &   pref_id_dummy8 == 1
replace cross_term_forepref9 = 1 if foreign == 1 &   pref_id_dummy9 == 1
replace cross_term_forepref10 = 1 if foreign == 1 &  pref_id_dummy10 ==1
replace cross_term_forepref11 = 1 if foreign == 1 &  pref_id_dummy11 ==1
replace cross_term_forepref12 = 1 if foreign == 1 &  pref_id_dummy12 ==1
replace cross_term_forepref13 = 1 if foreign == 1 &  pref_id_dummy13 ==1
replace cross_term_forepref14 = 1 if foreign == 1 &  pref_id_dummy14 ==1
replace cross_term_forepref15  = 1 if foreign == 1 & pref_id_dummy15 ==1
replace cross_term_forepref16 = 1  if foreign == 1 & pref_id_dummy16 ==1
replace cross_term_forepref17 = 1  if foreign == 1 & pref_id_dummy17 ==1
replace cross_term_forepref18 = 1  if foreign == 1 & pref_id_dummy18 ==1
replace cross_term_forepref19 = 1  if foreign == 1 & pref_id_dummy19 ==1
replace cross_term_forepref20 = 1  if foreign == 1 & pref_id_dummy20 ==1
replace cross_term_forepref21 = 1  if foreign == 1 & pref_id_dummy21 ==1
replace cross_term_forepref22 = 1  if foreign == 1 & pref_id_dummy22 ==1
replace cross_term_forepref23 = 1  if foreign == 1 & pref_id_dummy23 ==1
replace cross_term_forepref24 = 1  if foreign == 1 & pref_id_dummy24 ==1
replace cross_term_forepref25 = 1  if foreign == 1 & pref_id_dummy25 ==1
replace cross_term_forepref26 = 1  if foreign == 1 & pref_id_dummy26 ==1
replace cross_term_forepref27 = 1  if foreign == 1 & pref_id_dummy27 ==1
replace cross_term_forepref28 = 1  if foreign == 1 & pref_id_dummy28 ==1
replace cross_term_forepref29 = 1  if foreign == 1 & pref_id_dummy29 ==1
replace cross_term_forepref30 = 1  if foreign == 1 & pref_id_dummy30 ==1
replace cross_term_forepref31 = 1  if foreign == 1 & pref_id_dummy31 ==1
replace cross_term_forepref32 = 1  if foreign == 1 & pref_id_dummy32 ==1
replace cross_term_forepref33 = 1  if foreign == 1 & pref_id_dummy33 ==1
replace cross_term_forepref34 = 1  if foreign == 1 & pref_id_dummy34 ==1
replace cross_term_forepref35 = 1  if foreign == 1 & pref_id_dummy35 ==1
replace cross_term_forepref36 = 1  if foreign == 1 & pref_id_dummy36 ==1
replace cross_term_forepref37 = 1  if foreign == 1 & pref_id_dummy37 ==1
replace cross_term_forepref38 = 1  if foreign == 1 & pref_id_dummy38 ==1
replace cross_term_forepref39 = 1  if foreign == 1 & pref_id_dummy39 ==1
replace cross_term_forepref40 = 1  if foreign == 1 & pref_id_dummy40 ==1
replace cross_term_forepref41 = 1  if foreign == 1 & pref_id_dummy41 ==1
replace cross_term_forepref42 = 1  if foreign == 1 & pref_id_dummy42 ==1
replace cross_term_forepref43 = 1  if foreign == 1 & pref_id_dummy43 ==1
replace cross_term_forepref44 = 1  if foreign == 1 & pref_id_dummy44 ==1
replace cross_term_forepref45 = 1  if foreign == 1 & pref_id_dummy45 ==1
replace cross_term_forepref46 = 1  if foreign == 1 & pref_id_dummy46 ==1
replace cross_term_forepref47 = 1  if foreign == 1 & pref_id_dummy47 ==1

xtset id time_id
xtreg consumption_stay_tourism cross_term project foreign cross_term_forepref1-cross_term_forepref47 pref_id_dummy1-pref_id_dummy47
outreg2 using final1.tex, replace


xtreg logcon cross_term project foreign cross_term_forepref1-cross_term_forepref47 pref_id_dummy1-pref_id_dummy47
outreg2 using final1.tex, append

xtreg logcon cross_term project q2 q3 q4 foreign cross_term_forepref1-cross_term_forepref47 pref_id_dummy1-pref_id_dummy47
outreg2 using final1.tex, append




clear all
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver"
use "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver/foreign.dta"

* create a new variable for time index
generate time_id =0
replace time_id = 1 if year==2018&term==2
replace time_id = 2 if year==2018&term==3
replace time_id = 3 if year==2018&term==4
replace time_id = 4 if year==2019&term==1
replace time_id = 5 if year==2019&term==2
replace time_id = 6 if year==2019&term==3
replace time_id = 7 if year==2019&term==4
replace time_id = 8 if year==2020&term==1
* create new dummy varables for quarters
generate q2=0
generate q3=0
generate q4=0
replace q2=1 if term==2
replace q3=1 if term==3
replace q4=1 if term==4
* create a new variable for prefecture id
egen country_id=group(country)
* creater a new dummy variable for cashless-point refund project
generate project=0
replace project=1 if year==2019&term==4
replace project=1 if year==2020&term==1
* create a new variable for female rate
generate femalerate=a_female_all/a_all
* create a new variable for average stay
generate ave_stay=(2*a_within_3days+5*a_4to6days+10*a_7to13days+17*a_14to20days+24*a_21to27days+35*a_28to90days+100*a_91days_to_1year)/a_all
* create a new variable for average income
generate ave_income=(250*a_income_500+750*a_income_1000+1500*a_income_2000+2500*a_income_3000+4000*a_income_over3000)/(a_income_500+a_income_1000+a_income_2000+a_income_3000+a_income_over3000)
* create new dummy varables for country
generate Korea=0
replace Korea=1 if country_id==15
* create a new variable for Japan first　
generate first_rate=a_japan_first/a_all
* create a new variable for single 
generate single=a_single/a_all
* create a new variable for sqrtN
generate rootN=sqrt(a_all)
generate Nc_all=c_all*rootN
generate Nave_stay=ave_stay*rootN
generate Nproject=project*rootN
generate Nq2=q2*rootN
generate Nq3=q3*rootN
generate Nq4=q4*rootN
generate Nave_income=ave_income*rootN
generate Nfemalerate=femalerate*rootN
generate Nfirst_rate=first_rate*rootN
generate Nsingle=single*rootN
save foreignmain



clear all
use foreignmain
xtset country_id time_id
xtreg Nc_all Nproject Nq2 Nq3 Nq4 Nave_stay  Nfemalerate Nfirst_rate Nsingle, fe vce(cluster country_id)
outreg2 using final2.tex, replace
xtset country_id time_id
xtreg Nc_all Nproject Nq2 Nq3 Nq4 Nave_stay Nfemalerate, fe vce(cluster country_id)
outreg2 using final2.tex, append



clear all
use foreign_long
* create a new variable for time index
generate time_id =0
replace time_id = 1 if year==2018&term==2
replace time_id = 2 if year==2018&term==3
replace time_id = 3 if year==2018&term==4
replace time_id = 4 if year==2019&term==1
replace time_id = 5 if year==2019&term==2
replace time_id = 6 if year==2019&term==3
replace time_id = 7 if year==2019&term==4
replace time_id = 8 if year==2020&term==1
* create new dummy varables for quarters
generate q2=0
generate q3=0
generate q4=0
replace q2=1 if term==2
replace q3=1 if term==3
replace q4=1 if term==4
* create a new variable for id
generate id=0
replace id=1 if package==1
replace id=2 if own==1
* create a new variable for id
egen country_id=group(country id)
* creater a new dummy variable for cashless-point refund project
generate project=0
replace project=1 if year==2019&term==4
replace project=1 if year==2020&term==1
* create a new variable for crossterm
generate crossterm=0
replace crossterm=1 if project==1 & own==1
* create a new variable for sqrtN
generate rootN=sqrt(answer)
generate Nconsumption=consumption*rootN
generate Nproject=project*rootN
generate Nq2=q2*rootN
generate Nq3=q3*rootN
generate Nq4=q4*rootN
generate Ncrossterm=crossterm*rootN
generate Nown=own*rootN
/*save 
foreign_long
*/
* ########################### CREATION OF THE SECOND DATASET END ########################### *
clear all
use foreign_long 
drop if Nconsumption == .
keep if own==1|package==1|tour==1
xtset country_id time_id
xtreg Nconsumption Ncrossterm Nown Nproject Nq2 Nq3 Nq4, fe vce(cluster country_id)





