% Computational Finance CW2
% Question 2
load options.mat
%%
strikePrices=[2925 3025 3125 3225 3325];
L=length(stockPrice);
Lwin=fix(L/4);

for i=1:(L-Lwin)
    S=stockPrice(Lwin+i);
    K=strikePrices(1);
    r=0.01;
    T=(L-Lwin-i)/365;
    sigma=sqrt(var(stockPrice(i:i+Lwin))); 
end
%%



 

