import excel "Updated_LN_Macro_Factors_2018AUG.xlsx", sheet("Sheet1") firstrow
rename Data time
save "LN.dta"