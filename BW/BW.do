* import the file 
import excel "%your_location%\Copy of Investor_Sentiment_Data_20160331_POST.xlsx", sheet("DATA") firstrow

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

* drop useless variable
drop month

* save the result
save "%your_location%\BWt.dta"