% Input data

InputDataFile= importdata('Data_Quiz.xlsx',1);
[row,col]=size(InputDataFile);

%% Plotting heatmap

x = 0:1:395;
figure(1)
hold on
for i=1:27
    subplot(5,7,i)
    plot(InputDataFile(:,i))
    title('Time series data plot')
end 

figure(2)
h=heatmap(InputDataFile);
title('Heatmap Plot')
xlabel('Time')
ylabel('Univariate Data')

%% Defining a covariance matrix for the data

CovData=cov(InputDataFile);
[p q] = size(CovData);
fprintf('The covariance data is given as:')
CovData

%% Calculation of eigen values and eigen vectors of the given data

lambda= eig(CovData);
[v,D] = eig(CovData);
lambda_sort = sort(lambda);

%% Choosing a feature vector for the given data

%Performing calculation for m=2
m = 2;
small = lambda(length(lambda)-m+1);
ind = find(lambda_sort>=small);
small
ind
for i=1:length(ind)
    f(:,i)=v(:,ind(i));
end
new_data1 = CovData*f;
%new_data1
r1=new_data1(:,1);
r2=new_data1(:,2);

figure(3)
scatter(r1,r2,100,'MarkerEdgeColor','k','MarkerfaceColor','r')
title('Scatter PLOT for 2D data')
xlabel('PC1')
ylabel('PC2')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold');

%Implementation of other Method for m=3
%----------------------------------------------
[ndata, text, alldata] = xlsread('Data_Quiz.xlsx');
InputDataFile = ndata(1:end,:);
[rown,columnn]=size(InputDataFile);

datacovmat=cov(InputDataFile);
[p q]=size(datacovmat);
lambda= eig(datacovmat);
% Calculate the eigenvectors corresponding to the eigen values
[newRw, ColD]=eig(datacovmat);


for i0=1:1:p
    diag(:,i0)=ColD(i0,i0);
end
 len=length(diag);
sorteddiag = sort(diag);

m=3;
smallest = sorteddiag(len-m+1); 
indices = find(diag >= smallest);
for in0=1:1:length(indices)
    pcomp(:,in0)=newRw(:,indices(in0));
end

new_data = InputDataFile*pcomp;
new_data

pcaData= pca( new_data );

data1=new_data(:,1);
data2=new_data(:,2);
data3=new_data(:,3);

size(pcomp)
size(InputDataFile)

%Obatining 3D plot for the data
figure(4)
scatter3(data1,data2,data3,100,'MarkerEdgeColor','k','MarkerfaceColor','r')
title('Scatter Plot data for 3 PCA')
xlabel('PC1')
ylabel('PC2')
zlabel('PC3')
set(gca,'box','off','linewidth',2,'fontsize',20,'fontweight','bold');


%% End of code