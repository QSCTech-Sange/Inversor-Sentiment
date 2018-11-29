* use rxba.dta to merge
use "rxba.dta" 

* merge CP
merge 1:1 month using "CP.dta"
keep if _merge ==3
drop _merge

* merge BW
merge 1:1 month using "BW.dta"
keep if _merge ==3
drop _merge

* merge LN
merge 1:1 month using "LN.dta"
keep if _merge ==3
drop _merge

* regression
regress barrx_t1n CP BW LN
predict rx_tplus1_n