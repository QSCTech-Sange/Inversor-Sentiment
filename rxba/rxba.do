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

***** Change the date to be the date format ****
***** and thus can be merged between different ****
***** datasets which contains only month ****

* Transform the date variable to sting format
tostring date, replace

* Generate a backup variable to be a DATE format
* Notice thar "YMD" may need changing to "YM"
* It depends on whether it contains day 
gen date_back = date(date, "YMD")

* generate a variable "moth of the date"
* since the exact day is not important
* but month is what we care
gen month=mofd(date_back)

* Make the month more friendly to read
* It's not necessary but recommanded 
format %tmCCYY-NN month

* drop variables which is no longer useful
drop date_back 

* save the data
save "rxba.dta"
