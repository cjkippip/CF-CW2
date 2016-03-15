% Computational Finance CW2
% Question 1-3
load options.mat
%%
%Q1
x1=0:40;
x2=40:45;
x3=45:100;

y1=40-x1;
y2=zeros(6,1);
y3=x3-45;

figure(1),clf,
plot(x1,y1,'b','LineWidth',2);
title('Comparison between BS and true price of call option','FontSize',15)
xlabel('stock price ','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(x2,y2,'b','LineWidth',2);
plot(x3,y3,'b','LineWidth',2);
grid on
hold off
%%
%Q2
strikePrices=[2925 3025 3125 3225 3325];
L=length(stockPrice);
Lwin=fix(L/4);
Lrest=L-Lwin;
logRet = price2logRet(stockPrice);
BSOptionCPrice=ones(Lrest,1);
hisVols=ones(167,1);
%%
for i=1:Lrest
    stdLogRet=std(logRet(i:i+Lwin-1)); 
    hisVols(i)=stdLogRet*sqrt(252);
    
    S=stockPrice(Lwin+i);
    K=strikePrices(1);
    r=0.06;
    T=(Lrest-i)/252;
    
    BSOptionCPrice(i)=blsprice(S,K,r,T,hisVols(i));
end
trueOptionCPrice=optionCPrice(Lwin+1:L,1);
%%
xx1=1:167;
figure(2),clf,
plot(xx1,BSOptionCPrice,'b','LineWidth',1.5);
title('Comparison between BS and true price of call option','FontSize',15)
xlabel('time(T/4+1 to T)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx1,trueOptionCPrice,'r','LineWidth',1.5);
legend({'BS price','True price'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off
%%
%Q3
randDays=randperm(167,30);
randDays=randDays+55;
impVols30=ones(30,1);
hisVols30=ones(30,1);
for i=1:30
    S=stockPrice(randDays(i));
    K=strikePrices(1);
    r=0.06;
    T=(L-randDays(i))/252;
    V=optionCPrice(randDays(i),1);
    impVols30(i)=blsimpv(S, K, r, T, V, [], [], [], {'Call'});
    hisVols30(i)=hisVols(randDays(i)-55);
end
%%
figure(3),clf,
scatter(hisVols30,impVols30,'b','LineWidth',2);
title('Comparison between implied volatility and historical volatility','FontSize',15)
xlabel('historical volatility','FontSize',13,'FontWeight','bold')
ylabel('implied volatility','FontSize',13,'FontWeight','bold')
grid on
hold off
%%
numK=300;
impVols100=ones(numK,1);
K=linspace(2875,3074,numK);
for i=1:numK
    S=stockPrice(randDays(2));
    r=0.06;
    T=(L-randDays(2))/252;
    V=optionCPrice(randDays(2),1);
       
    impVols100(i)=blsimpv(S, K(i), r, T, V, [], 0, [], {'Call'});
    
end
%%
figure(4),clf,
scatter(K,impVols100,'b','LineWidth',2);
title('Comparison between implied volatility and historical volatility','FontSize',15)
xlabel('','FontSize',13,'FontWeight','bold')
ylabel('','FontSize',13,'FontWeight','bold')
grid on
hold off



