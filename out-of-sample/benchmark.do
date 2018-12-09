* 开始牛逼轰轰的宏
forvalues i=2(1)5{
    use "C:\Users\jimmy\OneDrive - zju.edu.cn\桌面\final.dta"

    * roll四次
    rolling _b, window(240) recursive saving(out-of-sample-rx`i', replace) : regress rx`i' bw f1 f3 f4 f8 f13 fedfunds cnstr consumerexpect CP_
   
    * 生成lead的变量
    gen rx`i'_lead = rx`i'[_n+1]
    gen rx2_benchmark = 0.0054004
    gen rx3_benchmark = 0.0088321
    gen rx4_benchmark = 0.0111721
    gen rx5_benchmark = 0.0100889
    gen bw_lead=bw[_n+1]
    gen f1_lead=f1[_n+1]
    gen f3_lead=f3[_n+1] 
    gen f4_lead=f4[_n+1] 
    gen f8_lead=f8[_n+1]
    gen f13_lead=f13[_n+1]
    gen fedfunds_lead = fedfunds[_n+1]
    gen cnstr_lead=cnstr[_n+1]
    gen consumerexpect_lead=consumerexpect[_n+1]
    gen CP_lead=CP_[_n+1]

    * 保留需要的变量
    keep month rx`i'_lead  bw_lead f1_lead f3_lead f13_lead f4_lead f8_lead f13_lead fedfunds_lead cnstr_lead consumerexpect_lead CP_lead rx2_benchmark rx3_benchmark rx4_benchmark rx5_benchmark
    
    * 和每次roll的结果合并
    rename month end
    merge 1:1 end using "C:\Users\jimmy\OneDrive - zju.edu.cn\桌面\out-of-sample-rx`i'.dta", nogenerate
    
    * 删除不需要的观测（为了保持和out-of-sample一致）
    keep in 240/460
    
    * 生成预测值
    gen rx`i'_est = bw_lead * _b_bw + f1_lead * _b_f1 + f4_lead * _b_f4 + f3_lead * _b_f3 + f8_lead * _b_f8 + f13_lead * _b_f13 + fedfunds_lead * _b_fedfunds + cnstr_lead * _b_cnstr + consumerexpect_lead * _b_consumerexpect + CP_lead * _b_CP_ + _b_cons 
    
    * 生成预测值和实际值差的平方
    gen minus_square_rx`i' = ( rx`i'_benchmark - rx`i'_est ) ^2

    * 生成均方根误差
    gen RMSE_rx`i' = sqrt(sum(minus_square_rx`i')/221)
    
    * 保留截止日期的预测和均方根误差，日期是为了方便合并
    keep end RMSE_rx`i'

    * 保留最后一行的结果
    keep in 221/221

    * 保存一下
    save "C:\Stata 15.1 x64\RMSE_rx`i'.dta"
}

* 合并所有的均方根误差
forvalues i=3(1)5{
    use "C:\Stata 15.1 x64\RMSE_rx2.dta" 
    merge 1:1 end using "C:\Stata 15.1 x64\RMSE_rx`i'.dta", nogenerate
    save "C:\Stata 15.1 x64\RMSE_rx2.dta", replace
}

* 保存结果
use "C:\Stata 15.1 x64\RMSE_rx2.dta"
drop end
save "C:\Stata 15.1 x64\RMSE_benchmark_all.dta"