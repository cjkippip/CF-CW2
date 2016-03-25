% Computational Finance CW2
% Question 5
load options.mat
%%
strikePrices=[2925 3025 3125 3225 3325];
L=length(stockPrice);
Lwin=fix(L/4);
Lrest=L-Lwin;

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
figure(1),clf,
plot(xx,callL,'b','LineWidth',2);
title('Comparison between BS and Lattice','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,callB,'r','LineWidth',2);
legend({'LatticeEurCall','BS Model'},'Location','southeast','FontSize',13,'FontWeight','bold');
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
figure(2),clf,
plot(xx,callL,'b','LineWidth',2);
title('Comparison between BS and Lattice','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,callB,'r','LineWidth',2);
legend({'LatticeEurCall','BS Model'},'Location','east','FontSize',13,'FontWeight','bold');
grid on
hold off



