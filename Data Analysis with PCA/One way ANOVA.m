%calculation of one way ANOVA
mat = [10 9 5; 8 7 9; 9 8 8];
[p,tb1,stats] =anova1(mat);


year=[1 2 3 4 5 6 7]';
catalyst=[5 8 10 15 18 22 30]';

%2D Scatter Plot
Y=[year catalyst];
figure(2);
scatter(Y(:,1),Y(:,2),100,'MarkerEdgeColor','k','MarkerFaceColor','r')
xlabel('Year')
ylabel('Catalyst production in KG')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold')

%% Calculation of alpha beta and regression 
%Part5d
x = [1 2 3 4 5 6 7]';
y = [5 8 10 15 18 22 30]';

X1 = [ones(size(x)) x];
b = regress(y,X1)

%calculation oif cavariance ofl x and Y
fprintf('The covariance for the given data is found as:')
cov(x,y)

%% Que1-c Residual Plot
%Part5e

figure(4) 
scatter(x,y,'filled')
hold on
title('Scatter Plot')
x0 = min(x):1:max(x);
yfit = b(1) + b(2)*x0 ;
plot([x0(1) x0(size(x0))],[yfit(1) yfit(size(x0))],'--b')
title('Residual Plot');
xlabel('Year')
ylabel('Catalyst')
grid minor

% Residual Plot
ys = b(1) + b(2)*x;
yr = y - ys;

figure(5)
scatter(ys,yr,'filled')
hold on
title('Residual Plot')
plot([0 1.8],[0 0],'--r')
ylabel('Catalyst')
xlabel('Year')
grid minor

