% Computational Finance CW2
% Question 5
S0=50;K=50;r=0.06;T=5/12;sigma=0.4;

callL=ones(1,50);
callB=ones(1,50)*blsprice(S0,K,r,T,sigma);
for i=1:50   
    callL(1,i)=LatticeEurCall(S0,K,r,T,sigma,i*20); 
end

xx=1:50;
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
S0=50;K=47;r=0.06;T=5/12;sigma=0.4;

callL=ones(1,50);
callB=ones(1,50)*blsprice(S0,K,r,T,sigma);
for i=1:50   
    callL(1,i)=LatticeEurCall(S0,K,r,T,sigma,i*20); 
end

xx=1:50;
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
%%
S0=50;K=42;r=0.06;T=5/12;sigma=0.4;

callL=ones(1,50);
callB=ones(1,50)*blsprice(S0,K,r,T,sigma);
for i=1:50   
    callL(1,i)=LatticeEurCall(S0,K,r,T,sigma,i*20); 
end

xx=1:50;
figure(3),clf,
plot(xx,callL,'b','LineWidth',2);
title('Comparison between BS and Lattice','FontSize',15)
xlabel('Increasing N(decreasing step time)','FontSize',13,'FontWeight','bold')
ylabel('Call option price','FontSize',13,'FontWeight','bold')
hold on
plot(xx,callB,'r','LineWidth',2);
legend({'LatticeEurCall','BS Model'},'Location','east','FontSize',13,'FontWeight','bold');
grid on
hold off


