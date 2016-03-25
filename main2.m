% Computational Finance CW2
% Question 2-3,5
load options.mat
%% Qusetion 2
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
xx1=56:222;
figure(1),clf,
plot(xx1,BSOptionCPrice,'b','LineWidth',1.5);
axis([56,222,0,inf])
title('Comparison between BS and true price of call option','FontSize',15)
ylabel('Call option price','FontSize',13,'FontWeight','bold')
xlabel('time(T/4+1 to T)','FontSize',13,'FontWeight','bold')
hold on
plot(xx1,trueOptionCPrice,'r','LineWidth',1.5);
legend({'BS price','True price'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
grid minor
hold off
% %% Put option
figure(2),clf,
plot(xx1,BSOptionPPrice,'b','LineWidth',1.5);
axis([56,222,0,inf])
title('Comparison between BS and true price of put option','FontSize',15)
ylabel('Put option price','FontSize',13,'FontWeight','bold')
xlabel('time(T/4+1 to T)','FontSize',13,'FontWeight','bold')
hold on
plot(xx1,trueOptionPPrice,'r','LineWidth',1.5);
legend({'BS price','True price'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
grid minor
hold off

%% Qusetion 3
optionNum=4;
randomNum=50;
randDays=randperm(167,randomNum);
randDays=randDays+55;
impVolsRand=ones(randomNum,1);
hisVolsRand=ones(randomNum,1);
maturity=ones(1,30);
for i=1:randomNum
    S=stockPrice(randDays(i));
    K=strikePrices(optionNum);
    r=0.06;
    T=(L-randDays(i))/252;
    maturity(i)=T;
    V=optionCPrice(randDays(i),optionNum);
    
    impVolsRand(i)=blsimpv(S, K, r, T, V);
    hisVolsRand(i)=hisVols(randDays(i)-55);
end

figure(3),clf,
scatter(hisVolsRand,impVolsRand,'b','LineWidth',2);
title('Comparison between implied volatility and historical volatility','FontSize',15)
ylabel('implied volatility','FontSize',13,'FontWeight','bold')
xlabel('historical volatility','FontSize',13,'FontWeight','bold')
grid on
hold off
%%
numK=600;
optionNum=1;
impVols100=ones(numK,1);
K=linspace(2801,3400,numK);
for i=1:numK
    S=stockPrice(randDays(2));
    r=0.06;
    T=(L-randDays(2))/252;
    V=optionCPrice(randDays(2),optionNum);
       
    impVols100(i)=blsimpv(S, K(i), r, T, V);  
end

figure(4),clf,
plot(K,impVols100,'b','LineWidth',2);
title('Implied volatility with different strike prices','FontSize',15)
ylabel('Implied volatility','FontSize',13,'FontWeight','bold')
xlabel('Stike price','FontSize',13,'FontWeight','bold')
grid on
hold off
%% Qusetion 5
dayNum=150;
optionNum=2;
step=100;

S0=stockPrice(dayNum);K=strikePrices(optionNum);
r=0.06;T=(L-dayNum)/252;sigma=hisVols(dayNum-55);

callL=ones(1,step);
callB=ones(1,step)*blsprice(S0,K,r,T,sigma);
for i=1:step   
    callL(1,i)=LatticeEurCall(S0,K,r,T,sigma,i); 
end

xx=1:step;
figure(5),clf,
plot(xx,callL,'b','LineWidth',2);
title('Comparison between BS and Lattice(Eur Call)','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,callB,'r','LineWidth',2);
legend({'LatticeEurCall','BS Model'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off
%%
dayNum=56;
optionNum=2;
step=100;

S0=stockPrice(dayNum);K=strikePrices(optionNum);
r=0.06;T=(L-dayNum)/252;sigma=hisVols(dayNum-55);

callL=ones(1,step);
callB=ones(1,step)*blsprice(S0,K,r,T,sigma);
for i=1:step   
    callL(1,i)=LatticeEurCall(S0,K,r,T,sigma,i); 
end

xx=1:step;
figure(6),clf,
plot(xx,callL,'b','LineWidth',2);
title('Comparison between BS and Lattice(Eur Call)','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,callB,'r','LineWidth',2);
legend({'LatticeEurCall','BS Model'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off
%% Qusetion 6
dayNum=150;
optionNum=2;
step=100;

S0=stockPrice(dayNum);K=strikePrices(optionNum);
r=0.06;T=(L-dayNum)/252;sigma=hisVols(dayNum-55);

putL=ones(1,step);
[call,put]=blsprice(S0,K,r,T,sigma);
putB=ones(1,step)*put;
for i=1:step   
    putL(1,i)=AmPutLattice(S0,K,r,T,sigma,i); 
end

xx=1:step;
figure(7),clf,
plot(xx,putL,'b','LineWidth',2);
title('Comparison between BS and Lattice(Am Put)','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Put option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,putB,'r','LineWidth',2);
legend({'LatticeAmPut','BS Model'},'Location','northeast','FontSize',13,'FontWeight','bold');
grid on
hold off
%%
dayNum=150;
optionNum=2;
step=100;

S0=stockPrice(dayNum);K=strikePrices(optionNum);
r=0.06;T=(L-dayNum)/252;sigma=hisVols(dayNum-55);

putL=ones(1,step);
[call,put]=blsprice(S0,K,r,T,sigma);
putB=ones(1,step)*call;
for i=1:step   
    putL(1,i)=AmCallLattice(S0,K,r,T,sigma,i); 
end

xx=1:step;
figure(8),clf,
plot(xx,putL,'b','LineWidth',2);
title('Comparison between BS and Lattice(Am Call)','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,putB,'r','LineWidth',2);
legend({'LatticeAmCall','BS Model'},'Location','southeast','FontSize',13,'FontWeight','bold');
grid on
hold off












