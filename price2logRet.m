function logRet=price2logRet(stockPrice)
L=length(stockPrice)-1;
logRet=ones(L,1);

for i=1:L
    logRet(i)=log(stockPrice(i+1)/stockPrice(i));
end