* import file from teammates
import excel "bond risk premium(1).xlsx", sheet("Sheet1") firstrow clear

* replace the format string of double
destring rx3, replace
destring rx4, replace
destring rx5, replace

* generate rxba
generate rxba = (rx2 + rx3 + rx4 + rx5)/4

* drop useless variables
keep rxba date

* save the data
save "rxba.dta"
