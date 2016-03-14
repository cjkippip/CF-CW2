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
S0=50;K=50;r=0.1;T=5/12;sigma=0.4;N=1000;
[BLcall,BLput] = blsprice(S0,K,r,T,sigma);
call2 = LatticeEurCall(S0,K,r,T,sigma,N);
put3 = AmPutLattice(S0,K,r,T,sigma,N);
Volatility = blsimpv(S0, K, r, T, 6.1165, 0.5, 0, [], {'Call'});
Volatility = blsimpv(100, 95, 0.075, 0.25, 10, 0.5, 0, [], {'Call'});
%%
% AAA=optionC{1};


