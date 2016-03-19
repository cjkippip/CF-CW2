%% compute 5 BS formular call and put option prices
load options.mat
strikePrices=[2925 3025 3125 3225 3325];
L=length(stockPrice);
Lwin=fix(L/4);
Lrest=L-Lwin;
logRet = price2logRet(stockPrice);
BSOptionCPrice=ones(Lrest,1);
BSOptionPPrice=ones(Lrest,1);
hisVols=ones(167,1);

BSOptionCPrices=ones(Lrest,5);
BSOptionPPrices=ones(Lrest,5);

for optionNum=1:5   
    for i=1:Lrest
        stdLogRet=std(logRet(i:i+Lwin-1)); 
        hisVols(i)=stdLogRet*sqrt(252);

        S=stockPrice(Lwin+i);
        K=strikePrices(optionNum);
        r=0.06;
        T=(Lrest-i)/252;

        [BSOptionCPrice(i),BSOptionPPrice(i)]=blsprice(S,K,r,T,hisVols(i));
    end
    
    BSOptionCPrices(:,optionNum)=BSOptionCPrice;
    BSOptionPPrices(:,optionNum)=BSOptionPPrice;
end