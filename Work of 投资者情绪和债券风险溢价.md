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

根据文献的公式，$\overline{rx}_{t+1}$从以下公式计算
$$
\overline{rx}_{t+1}=(1/4)\sum_{n=2}^5rx_{t+1}^{(n)}
$$


其中，$rx_{t+1}^{(n)}$ 的数据为小组其他成员所取得。目前，rxba的数据处理已经完成。难点在于为了以后的合并所做的日期处理



## CPt的来源

$CP_t$的数据为
$$
\overline{rx}_{t+1}=\lambda_0+\lambda_1y_t^{(1)}+\lambda_2f_t^{1\to2}+\lambda_3f_t^{2\to3}+\lambda_4f_t^{3\to4}+\lambda_5f_t^{4\to5}+u_{t+1}
$$
这个回归中的拟合值，但是CP小组已经计算好了CP，我们将直接使用。

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