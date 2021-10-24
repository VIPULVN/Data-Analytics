function output = StandardDeviation_AUCPlot()

%% Drugc and Drugn data can be referred from the Data Folder file
colData=xlsread('drugc.xlsx',1);
colData2=xlsread('drugc.xlsx',2);
colData3=xlsread('drugc.xlsx',3);
colData4=xlsread('drugc.xlsx',4);

colData5=xlsread('drugn.xlsx',3);

col1 = colData3(:,1);
col2 = colData3(:,2);
col3 = colData3(:,3);
col4 = colData3(:,4);
colf = colData3(:,1:4);

%% Drawing a box plot

figure(1)
boxplot(colf);
xlabel('Drug concentration');
ylabel('Area Under Curve AUC');
title('Box plot with scatter data');
hold on

plot(1,col1,'ro','Displayname','1');
hold on
plot(2,col2,'bo','Displayname','2');
hold on
plot(3,col3,'go','Displayname','3');
hold on
plot(4,col4,'mo','Displayname','4');
hold off;

%% Calculation of mean and standard deviation of AUC
%colData3 consists of AUC data

Anova_peak3 = [colData3(:,2) colData3(:,3) colData3(:,4)];

AUC_mean1= mean (colData3(1:54));
AUC_mean2= mean(Anova_peak3);
AUC_mean= [AUC_mean1 AUC_mean2];

AUC_std1 = std(colData3(1:54));
AUC_std2 = std(Anova_peak3);
AUC_std = [AUC_std1 AUC_std2];

AUC_sem1=std(colData3(1:54))/sqrt(length(colData3(1:54)));
AUC_sem2=std(Anova_peak3)/sqrt(length(Anova_peak3));
AUC_sem = [AUC_sem1 AUC_sem2];

disp(AUC_mean)
disp(AUC_std)

figure(2)
errorbar(AUC_mean,AUC_sem,'linewidth',2.5)
xlabel('Drug concentration (ng/mL)','Fontsize',14);
ylabel('Area under curve(AUC)','Fontsize',14);
title('Area under curve(AUC)','Fontsize',14)
box off

%% Part2-a-HeatMap plotting
%Heatmap for drugc data
figure (3)
heatmap(colData3)

%Heatmap for drugn data
figure (4)
heatmap(colData5)


%% Part2b-HeatMap combined for both drugs

sx = size(colData3);
sy = size(colData5);
a = max(sx(1),sy(1));
z = [[colData3;zeros(abs([a 0]-sx))],[colData5;zeros(abs([a,0]-sy))]];

figure(5)
heatmap(z)

%Comments- Common heatmap can be difficult for analysis but some conclusion can not be
%made accurately as the dimension of the matrices did not match in this
%case.
end