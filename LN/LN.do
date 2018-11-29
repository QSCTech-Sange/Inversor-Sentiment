* import the file we downloaded
import excel "Updated_LN_Macro_Factors_2018AUG.xlsx", sheet("Sheet1") firstrow

* change the date to be month
* the original data is a well defined 
* form so the step is simple.
gen month=mofd(Data)
format %tmCCYY-NN month
drop Data

* merge the data form rxba
merge 1:1 month using "rxba.dta"
keep if _merge==3
drop _merge

* Place the variable in the first place
order month

* do the regression
regress barrx_t1n F1 F13 F3 F4 F8
predict LN

keep month LN
save "LN.dta"