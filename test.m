% figure(1),clf,
% plot(PRisk,PRoR,'LineWidth',2)
% title('Mean Variance Porfolio','FontSize',15)
% xlabel('V(risk)','FontSize',13,'FontWeight','bold')
% ylabel('E(return)','FontSize',13,'FontWeight','bold')
% hold on
% scatter(PV,PE,'r');
% grid on
% hold off
%%
% S0=50;K=50;r=0.1;T=5/12;sigma=0.4;N=1000;
% [BScall,BSput] = blsprice(S0,K,r,T,sigma);
% call2 = LatticeEurCall(S0,K,r,T,sigma,N);
% put3 = AmPutLattice(S0,K,r,T,sigma,N);
% Volatility = blsimpv(S0, K, r, T, 6.1165, 0.5, 0, [], {'Call'});
% Volatility = blsimpv(100, 95, 0.075, 0.25, 10, 0.5, 0, [], {'Call'});
%%
% AAA=optionC{1};
%%
% A=price2ret(stockPrice);
% B=log(A);
% C=abs(B);
% 
% logRet = abs(log(price2ret(stockPrice)));
%%
% x=-10:10;
% y=x.^4;
% yy=diff(y);
% yyy=diff(yy);
% 
% figure(20),clf
% plot(y);
% 
% figure(21),clf
% plot(yy);
% 
% figure(22),clf
% plot(yyy);
%%
i=30;
S=stockPrice(randDays(i));
K=strikePrices(1);
r=0.06;
T=(L-randDays(i))/252;
V=optionCPrice(randDays(i),1);
aaa=blsimpv(S, K, r, T, V, [], [], [], {'Call'});
%%
aaa=blsimpv(9, 999, 0.06, 222/252, 23, [], [], [], {'Call'});










