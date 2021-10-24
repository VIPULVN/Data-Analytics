
%Data for lowest Dose case 1
%% Initialize data from sheet drugc and drugn

close all;
clear all;
drugC = importdata('drugc.xlsx');
drugN = importdata('drugn.xlsx');
drugC1=drugC.data.Cmax(:,1);
drugC2=drugC.data.Tmax(:,1);
st=[drugC1 drugC2];

%Reading DrugN data
drugN1=drugN.data.Cmax(:,1);
drugN2=drugN.data.Tmax(:,1);
drugNComb=[drugN1 drugN2];

%Scatter plot for DrugC data
figure(1)
scatter(st(:,1),st(:,2),100,'MarkerEdgeColor','k','MarkerfaceColor','b')
xlabel('cmax')
ylabel('tmax')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold');

figure(2)
scatter(drugNComb(:,1),drugNComb(:,2),100,'MarkerEdgeColor','k','MarkerfaceColor','b')
xlabel('cmax')
ylabel('tmax')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold');


%% Initialise data for clustering for k=3 (Part3)
k=3;

%Using Euclidian distance for plotting
[idx1,c,sumd,D] = kmeans(st,k);
figure(3)
plot(st(idx1==1,1),st(idx1==1,2),'ro')
hold on
plot(st(idx1==2,1),st(idx1==2,2),'bo')
hold on
plot(st(idx1==3,1),st(idx1==3,2),'co')
hold on
%plot(st(idx1==4,1),st(idx1==4,2),'mo')
plot(c(:,1),c(:,2),'kx','MarkerSize',12,'LineWidth',3)
hold on
xlabel('Cmax','Fontsize',14);
ylabel('Tmax','Fontsize',14);
title('clustering data with Euclidian distance for k=3','Fontsize',14);


%Using Manhattan distance for plotting
[idx,c1,sumd1,D1] = kmeans(st,k,'Distance','cityblock');
figure(4)
plot(st(idx==1,1),st(idx==1,2),'ro')
hold on
plot(st(idx==2,1),st(idx==2,2),'bo')
hold on
plot(st(idx==3,1),st(idx==3,2),'co')
hold on
%plot(st(idx1==4,1),st(idx1==4,2),'mo')
plot(c1(:,1),c1(:,2),'kx','MarkerSize',12,'LineWidth',3)
hold on
xlabel('Cmax','Fontsize',14);
ylabel('Tmax','Fontsize',14);
title('clustering data with Manhattan distance for k=3','Fontsize',14);


%% Part4-Calculation of Davies-Bouldin criterion values for euclidian distance

eva = evalclusters(st,idx1,'DaviesBouldin')

%Calculation for Euclidian distance
%Calculation of optimal number of suitable cluster for the method
for cluster = 1:5
    [idx1,c,sumd,D] = kmeans(st,cluster);
    eva = evalclusters(st,idx1,'DaviesBouldin')
    
end

%Verification by using evalclusters method
E = evalclusters(st,'kmeans','DaviesBouldin','klist',[1:6])
figure(5);
plot(E)

figure(6);
gscatter(st(:,1),st(:,2),E.OptimalY,'rbg','xod')


%NumObservations: 54
%   InspectedK: 2
%   CriterionValues: 0.2362
%-----------------------------
%    InspectedK:3
%    CriterionValues: 0.5616
%------------------------------
%    InspectedK: 4
%    CriterionValues: 0.4503
%------------------------------
%    InspectedK: 5
%    CriterionValues: 0.5284
%------------------------------
%On the basis of data obtained for K=2, the most optimal  value for K=2 as CriterionValues is = 0.2362

%% %% Manhattan plot for k=2, K=3, K=4;

%Using Manhattan distance for plotting
k=2;
[idx,c1,sumd1,D1] = kmeans(st,k,'Distance','cityblock');
figure(7)
plot(st(idx==1,1),st(idx==1,2),'ro')
hold on
plot(st(idx==2,1),st(idx==2,2),'bo')
hold on
plot(c1(:,1),c1(:,2),'kx','MarkerSize',12,'LineWidth',3)
hold on
xlabel('Cmax','Fontsize',14);
ylabel('Tmax','Fontsize',14);
title('clustering data with Manhattan distance for k=2','Fontsize',14);

k=3;
[idx,c1,sumd1,D1] = kmeans(st,k,'Distance','cityblock');
figure(8)
plot(st(idx==1,1),st(idx==1,2),'ro')
hold on
plot(st(idx==2,1),st(idx==2,2),'bo')
hold on
plot(st(idx==3,1),st(idx==3,2),'co')
hold on
%plot(st(idx1==4,1),st(idx1==4,2),'mo')
plot(c1(:,1),c1(:,2),'kx','MarkerSize',12,'LineWidth',3)
hold on
xlabel('Cmax','Fontsize',14);
ylabel('Tmax','Fontsize',14);
title('clustering data with Manhattan distance for k=3','Fontsize',14);

k=4;
[idx,c1,sumd1,D1] = kmeans(st,k,'Distance','cityblock');
figure(9)
plot(st(idx==1,1),st(idx==1,2),'ro')
hold on
plot(st(idx==2,1),st(idx==2,2),'bo')
hold on
plot(st(idx==3,1),st(idx==3,2),'co')
hold on
plot(st(idx1==4,1),st(idx1==4,2),'mo')
plot(c1(:,1),c1(:,2),'kx','MarkerSize',12,'LineWidth',3)
hold on
xlabel('Cmax','Fontsize',14);
ylabel('Tmax','Fontsize',14);
title('clustering data with Manhattan distance for k=4','Fontsize',14);

%% Part4-Calculation of Davies-Bouldin criterion values for Manhattan distance

eva1 = evalclusters(st,idx,'DaviesBouldin')

%Calculation for Euclidian dikstance
%Calculation of optimal number of suitable cluster for the method
for cluster = 2:5
    [idx,c1,sumd1,D1] = kmeans(st,cluster,'Distance','cityblock');
    eva1 = evalclusters(st,idx,'DaviesBouldin')
    
end
%Verification by using evalclusters method
E = evalclusters(st,'kmeans','DaviesBouldin','klist',[1:6])
figure(10);
plot(E)

figure(11);
gscatter(st(:,1),st(:,2),E.OptimalY,'rbg','xod')

%NumObservations: 54
%       InspectedK: 1
%       CriterionValues: NaN
%--------------------------------
%       InspectedK: 2
%       CriterionValues: 0.2362
%--------------------------------
%       InspectedK: 3
%       CriterionValues: 0.5169
%--------------------------------
%       InspectedK: 4
%       CriterionValues: 0.4735
%--------------------------------
%       InspectedK: 5
%       CriterionValues: 0.4592
%--------------------------------

%From the Manhattan distance values, K=2 gives good results. On the basis
%of obtained results, both distance methods yeild same magnitude for d.
%Hence, either of the given methods can be selected. 


%% Plotting silhoutte plot for various values of K= 2 to 5

s = silhouette(st,idx,'cityblock');
silhouette(st,idx,'cityblock')

%% Comments on results 
%In this case, the optimal values of k has been found to be 2.
%The conclusion can be made on the basis of results obtained through
%plotting Manhattan distance and Eucidian distance and it has been found
%that DB criteria has been found to be equal to 0.2362