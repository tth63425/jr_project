clear all
cd "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver"
use "/Users/akirasato/Documents/Okamuro_Seminar/Okamuro_seminar_2020/jr_project/final_ver/zoukaritsu.dta"

reg consumption_stay_tourism cross_term project foreign
reg consumption_stay_tourism cross_term project foreign q2 q3 q4

tabulate pref_id, generate (pref_id_dummy)

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

gen logcon = log(consumption_stay_tourism)
xtreg logcon cross_term project foreign cross_term_forepref1-cross_term_forepref47 pref_id_dummy1-pref_id_dummy47
outreg2 using final1.tex, append

xtreg logcon cross_term project q2 q3 q4 foreign cross_term_forepref1-cross_term_forepref47 pref_id_dummy1-pref_id_dummy47
outreg2 using final1.append




