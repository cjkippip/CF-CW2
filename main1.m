% Computational Finance CW2
% Question 1
load options.mat
%% Q1
x1=0:40;
x2=40:45;
x3=45:85;
y1=40-x1;
y2=zeros(6,1);
y3=x3-45;

xx1=0:0.5:42.5;
xx2=42.5:0.5:85;
yy1=45-xx1;
yy2=xx2-40;

figure(1),clf,
plot(x1,y1,'b','LineWidth',2);
title('Profit of asset price','FontSize',15)
ylabel('Profit','FontSize',13,'FontWeight','bold')
xlabel('Asset price','FontSize',13,'FontWeight','bold')
hold on
plot(x2,y2,'b','LineWidth',2);
plot(x3,y3,'b','LineWidth',2);
plot(xx1,yy1,'b.','LineWidth',2);
plot(xx2,yy2,'b.','LineWidth',2);
axis([0 85 0 45])
grid on
hold off





