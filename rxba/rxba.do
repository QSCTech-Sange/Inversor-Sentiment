* import file from teammates
import excel "C:\Users\jimmy\OneDrive - zju.edu.cn\文档\GitHub\Inversor-Sentiment\rxba\CP值", sheet("Sheet1") firstrow clear

* drop useless variables
keep barrx_t1n date

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
drop date_back date

* drop if no rxba exists
drop if barrx_t1n ==.

* Place the variable in the first place
order month

* save the data
save "rxba.dta"
