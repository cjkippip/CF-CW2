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
% i=30;
% S=stockPrice(randDays(i));
% K=strikePrices(1);
% r=0.06;
% T=(L-randDays(i))/252;
% V=optionCPrice(randDays(i),1);
% aaa=blsimpv(S, K, r, T, V, [], [], [], {'Call'});
%%
% aaa=blsimpv(9, 999, 0.06, 222/252, 23, [], [], [], {'Call'});
%%
% S=50;
% K=52;
% r=0.05;
% T=2;
% N=2;
% aaa=AmPutLattice(S,K,r,T,N);
%%
% S=50;
% K=50;
% r=0.05;
% T=1;
% sigma=0.2;
% NRepl=1000000;
% price=ones(5,1);
% nuT = (r - 0.5*sigma^2)*T;
% DiscPayoff = exp(-r*T)*(S*exp(nuT)-K);
% for i=1:5
%     randn('state',i);
%     price(i) = BlsMC1(S,K,r,T,sigma,NRepl);
% end
%%
% [BScall,BSput] = blsprice(S,K,r,T,sigma);
%%
% AA1=[4 9;16 25];
% AA2=sqrt(AA1);
%%
Volatility=ones(100,1);
for k=51:150
    Volatility(k-50) = blsimpv(100, k, 0.075, 0.25, 10, 0.5);

end
figure(1),clf,
xx1=51:1:150;
plot(xx1,Volatility);
%%
    S = 100; K = (40:25:160)'; T = (0.25:0.25:1)'; % Define Key Variables
    r = 0.01; q = 0.03;
    cp = 1; % i.e. call
    P = ...
        [[59.3526805861312,34.4154741312210,10.3406451776045,0.501199199160055,0.0101623685145268;];
        [58.7107005379958,33.8563481863964,10.9917759513981,1.36915029885860,0.143324063090580;];
        [58.0742593358310,33.3567195106962,11.5012247391034,2.12859686975881,0.400045353619436;];
        [57.4444414750070,32.9126689586500,11.9027988146544,2.77274776123341,0.708059729236718;];];
    [mK,mT] = meshgrid(K,T);
    [sigma,C] = calcBSImpVol(cp,P,S,mK,mT,r,q);
    mesh(mK,mT,sigma);
%%
      S = 100; K = (40:25:160)'; T = (0.25:0.25:1)'; % Define Key Variables
      cp = [ones(4,3),-ones(4,2)]; % [Calls[4,3],Puts[4,2]]
      R = 0.01*repmat([1.15;1.10;1.05;1],1,5); % 
      Q = 0.03*repmat([1.3;1.2;1.1;1],1,5);
      P = ...
          [[59.1445725607811,34.2167401269277,10.1798771553458,16.1224863211251,40.5779719086946];
          [58.4355054500906,33.5945826994415,10.7977275764632,17.4776751735401,41.1533978186314];
          [57.8694061672804,33.1636044111551,11.3636963648521,18.6294544130139,41.7369813312724];
          [57.4444414750070,32.9126689586500,11.9027988146694,19.5839252875422,42.2704830992694]];
      [mK,mT] = meshgrid(K,T);
      [sigma,C] = calcBSImpVol(cp,P,S,mK,mT,R,Q);
      mesh(mK,mT,sigma);
      hold on; scatter3(mK(:),mT(:),sigma(:),60,[0,0,0],'filled'); hold off
      xlabel('Strike'); ylabel('Expiry'); zlabel('Volatility');
%%
numK=50;
impVolMat=ones(20,numK);
for numRandDay=1:20
    optionNum=3;
    K=linspace(2801,3800,numK);
    for i=1:numK
        S=stockPrice(randDays(numRandDay));
        r=0.06;
        T=(L-randDays(numRandDay))/252;
    %     V=optionCPrice(randDays(numRandDay),optionNum);
        V=optionPPrice(randDays(numRandDay),optionNum);
        impVolMat(numRandDay,i)=blsimpv(S, K(i), r, T, V);  
    end
end

%%
xx1=1:20;xx2=1:50;
figure(4),clf,
mesh(impVolMat);
grid on
hold off















