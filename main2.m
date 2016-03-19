% Computational Finance CW2
% Question 2-3
load options.mat
%% Q2
optionNum=1;
strikePrices=[2925 3025 3125 3225 3325];
L=length(stockPrice);
Lwin=fix(L/4);
Lrest=L-Lwin;
logRet = price2logRet(stockPrice);
BSOptionCPrice=ones(Lrest,1);
BSOptionPPrice=ones(Lrest,1);
hisVols=ones(167,1);
% %% 
for i=1:Lrest
    stdLogRet=std(logRet(i:i+Lwin-1)); 
    hisVols(i)=stdLogRet*sqrt(252);
    
    S=stockPrice(Lwin+i);
    K=strikePrices(optionNum);
    r=0.06;
    T=(Lrest-i)/252;
    
    [BSOptionCPrice(i),BSOptionPPrice(i)]=blsprice(S,K,r,T,hisVols(i));
end
trueOptionCPrice=optionCPrice(Lwin+1:L,optionNum);
trueOptionPPrice=optionPPrice(Lwin+1:L,optionNum);
% %% Call option
xx1=1:167;
figure(1),clf,
plot(xx1,BSOptionCPrice,'b','LineWidth',1.5);
title('Comparison between BS and true price of call option','FontSize',15)
ylabel('Call option price','FontSize',13,'FontWeight','bold')
xlabel('time(T/4+1 to T)','FontSize',13,'FontWeight','bold')
hold on
plot(xx1,trueOptionCPrice,'r','LineWidth',1.5);
legend({'BS price','True price'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off
% %% Put option
figure(2),clf,
plot(xx1,BSOptionPPrice,'b','LineWidth',1.5);
title('Comparison between BS and true price of put option','FontSize',15)
ylabel('Put option price','FontSize',13,'FontWeight','bold')
xlabel('time(T/4+1 to T)','FontSize',13,'FontWeight','bold')
hold on
plot(xx1,trueOptionPPrice,'r','LineWidth',1.5);
legend({'BS price','True price'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off

%% Q3
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
ylabel('implied volatility','FontSize',13,'FontWeight','bold')
xlabel('historical volatility','FontSize',13,'FontWeight','bold')
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
ylabel('','FontSize',13,'FontWeight','bold')
xlabel('','FontSize',13,'FontWeight','bold')
grid on
hold off
