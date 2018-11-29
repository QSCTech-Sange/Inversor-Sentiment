*********************************
********DATA PROCESS OF BW********
*********************************

* import the file 
import excel "Copy of Investor_Sentiment_Data_20160331_POST.xlsx", sheet("DATA") firstrow

* keep the time and SENT^
* NOTE THAT SENT^ IS REPRESENTED IN SENT IN STATA, WHILE SENT IS REPRESENTED IN C
keep yearmo SENT

* drop the missing data
keep if SENT != "."

* generate the order to fo the time series method
generate month = _n

* set month to be the time
tset month

* transform SENT to float type
destring SENT, replace float

* generate SENT^2
generate SENT2 = SENT * SENT

* generate deltaSENT
generate deltaSENT = D.SENT

* drop useless variable and  oberservations
* (no deltaSent in OBS 1)
drop in 1/1
drop month

* rename variables to make merging easier
rename yearmo date

* Change the date's format to be able to merge
tostring date, replace
gen date_back = date(date, "YM")
gen month=mofd(date_back)
format %tmCCYY-NN month
drop date_back date

* save the result
save "%your_location%\BWt.dta"

***************************
******** Merge rxba ********
***************************

* merge form rxba
merge 1:1 month using "rxba.dta"

* keep the data that is merged
* (_merge==3 indicates that 
* the date contains rxba and BW)
keep if _merge ==3
drop _merge

***************************
******** Regression ********
***************************