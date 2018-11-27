# 投资者情绪和债券风险溢价



## 总回归模型

$$
rx_{t+1}^{(n)}=b_{n,CP}CP_t+b_{n,LN}LN_t+b_{n,BW}BW_t+\xi_{t+1}^{(n)}
$$

其中，$rx_{t+1}^{(n)}$为从一年期债券的收益中获得的超额收益

​	   $b$ 为系数

​           $CP_t$为单一回报预测因子

​	   $LN_t$为宏观因素

​	   $BW_t$为情绪因素

​	   $\xi_{t+1}^{(n)}$ 为误差项



## rxba的来源

TBC



## CPt的来源





## LNt来源

$LN_t$来源于以下回归的拟合值
$$
\overline{rx}_{t+1}=\theta_0+\theta_1F_{1t}+\theta_2F_{1t}^3+\theta_4F_{3t}+\theta_5F_{4t}+\theta_6F_{8t}+v_{t+1}
$$
原文使用的Sydney Ludvigson的网站已经失效，善用搜索找到了他的新网站

https://www.sydneyludvigson.com/data-and-appendixes/

下载了数据`Updated_LN_Macro_Factors_2018AUG`，包含了所需要的所有Factor.



## BWt来源（已完成）

$BW_t$ 来源于以下回归的拟合值
$$
\overline{rx}_{t+1}=\phi_0+\phi_1S_t^{\perp} + \phi_2S_t^{\perp2}+\phi_3\Delta S_t^{\perp} + \tau_{t+1}
$$
根据

> Laborda and Olmo 2014

文章所述，$S_t^{\perp}$ 在[Investor sentiment data (annual and monthly)](http://pages.stern.nyu.edu/~jwurgler/data/Copy%20of%20Investor_Sentiment_Data_20160331_POST.xlsx)这篇数据中获得。

BW数据处理已经完成，已经上传Github.



## 分析和检验

TBC