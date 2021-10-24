
%% scatter plot

cmax=xlsread('drugc.xlsx',1);
auc=xlsread('drugc.xlsx',3);

Y=[cmax(:,1) auc(:,1)];
figure(1);
scatter(Y(:,1),Y(:,2),100,'MarkerEdgeColor','k','MarkerFaceColor','r')
title('Scatter plot for cmax vs AUC')
xlabel('Tmax')
ylabel('AUC')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold')

%% Clustering data

figure(2)
k=3;
opts = statset('Display','final');


%Using Eucledian distance
[idx,C,sumD,D]=kmeans(Y,k,'Distance','sqeuclidean','Replicates',10,'Options',opts);
color=hsv(k);
for i=1:k
    scatter(Y(idx==i,1),Y(idx==i,2),100,'MarkerEdgeColor','k','MarkerFaceColor',color(i,:))
    hold on
end
title('Clustering data')
xlabel('Cmax')
ylabel('AUC')
hold on
plot(C(:,1),C(:,2),'kX','markersize',10)
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold')
%% Subplot data
x = 0:1:27;
figure(3)

hold on
for i=1:4
    subplot(5,7,i)
    plot(cmax(:,i))
    title('Subplot')
end 



D12c1 = (sumD(1)+sumD(2))/(((C(1,1)-C(2,1))^2 +(C(1,2)-C(2,2))^2)^0.5);
D13c1 = (sumD(1)+sumD(3))/(((C(1,1)-C(3,1))^2 +(C(1,2)-C(3,2))^2)^0.5);
D23c1 = (sumD(2)+sumD(3))/(((C(2,1)-C(3,1))^2 +(C(2,2)-C(3,2))^2)^0.5);
DBC1 = max([D12c1,D13c1,D23c1]);
DBC1

%% PArtb
cmax=xlsread('drugn.xlsx',1);
auc=xlsread('drugn.xlsx',3);

Y=[cmax(:,1) auc(:,1)];
figure(1);
scatter(Y(:,1),Y(:,2),100,'MarkerEdgeColor','k','MarkerFaceColor','r')
title('Scatter plot for cmax vs AUC')
xlabel('Tmax')
ylabel('AUC')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold')

%% Clustering data

figure(4)
k=3;
opts = statset('Display','final');


%Using Eucledian distance
[idx,C,sumD,D]=kmeans(Y,k,'Distance','sqeuclidean','Replicates',10,'Options',opts);
color=hsv(k);
for i=1:k
    scatter(Y(idx==i,1),Y(idx==i,2),100,'MarkerEdgeColor','k','MarkerFaceColor',color(i,:))
    hold on
end
title('Clustering data')
xlabel('Cmax')
ylabel('AUC')
hold on
plot(C(:,1),C(:,2),'kX','markersize',10)
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold')
%% Subplot data
x = 0:1:27;
figure(5)

hold on
for i=1:4
    subplot(5,7,i)
    plot(cmax(:,i))
    title('Subplot')
end 
%Parte

D12c1 = (sumD(1)+sumD(2))/(((C(1,1)-C(2,1))^2 +(C(1,2)-C(2,2))^2)^0.5);
D13c1 = (sumD(1)+sumD(3))/(((C(1,1)-C(3,1))^2 +(C(1,2)-C(3,2))^2)^0.5);
D23c1 = (sumD(2)+sumD(3))/(((C(2,1)-C(3,1))^2 +(C(2,2)-C(3,2))^2)^0.5);
DBC1 = max([D12c1,D13c1,D23c1]);
DBC1


%% Calculation of eigen values and eigen vectors of the data

A = [3 -2;1 0];

lambda= eig(A);
[v,D] = eig(A);

fprintf('The eigen values are given by')
lambda


fprintf('The eigen Vectors corrosponding to the eigen values are given by')
v

