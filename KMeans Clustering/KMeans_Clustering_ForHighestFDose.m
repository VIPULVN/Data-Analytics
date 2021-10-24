%Analysis for Data with Highest Dose
%% Initialize data from sheet drugc and drugn

close all;
clear all;
drugC = importdata('drugc.xlsx');
drugN = importdata('drugn.xlsx');

%Fetching data for highest dose
drugC1=drugC.data.Cmax(:,4);
drugC2=drugC.data.Tmax(:,4);
st=[drugC1 drugC2];

%Reading DrugN data
drugN1=drugN.data.Cmax(:,1);
drugN2=drugN.data.Tmax(:,1);
drugNComb=[drugN1 drugN2];

%Scatter plot for DrugC data
figure(1)
scatter(st(:,1),st(:,2),100,'MarkerEdgeColor','k','MarkerfaceColor','r')
xlabel('cmax')
ylabel('tmax')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold');

figure(2)
scatter(drugNComb(:,1),drugNComb(:,2),100,'MarkerEdgeColor','k','MarkerfaceColor','g')
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
%   CriterionValues: 0.4026
%-----------------------------
%    InspectedK:3
%    CriterionValues: 0.6028
%------------------------------
%    InspectedK: 4
%    CriterionValues: 0.6236
%------------------------------
%    InspectedK: 5
%    CriterionValues: 0.6759
%------------------------------
%On the basis of data obtained for K=2, the most optimal  value for K=2 as
%CriterionValues is = 0.4026 (DB criteria)

%% Manhattan plot for k=2, K=3, K=4;

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
%       CriterionValues: 0.7878
%--------------------------------
%       InspectedK: 3
%       CriterionValues: 1.1412
%--------------------------------
%       InspectedK: 4
%       CriterionValues: 0.6311
%--------------------------------
%       InspectedK: 5
%       CriterionValues: 0.7252
%--------------------------------

%From the Manhattan distance values, K=2 gives good results. On the basis
%of obtained results, both distance methods yeild same magnitude for d.
%Hence, either of the given methods can be selected. 


%% Plotting silhoutte plot for various values of K= 2 to 5

s = silhouette(st,idx,'cityblock');
silhouette(st,idx,'cityblock')

%% Comments on results

%In case of Mahattan plot the optimal index value is found to be 0.6311 which
%corresponds to k=3, while its comparison with eucledian plot suggests
%that K=2 is the index which gives minimum magnitude of  0.4026 (DB
%crieteria). Hence, in case of higher doses, eucledian distance is more
%preffered.
