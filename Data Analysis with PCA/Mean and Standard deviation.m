drugc = importdata('drugc.xlsx');
colData3=xlsread('drugc.xlsx',3);
drugn = importdata('drugn.xlsx');


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

%% BoxPlot for Drug C

dose=[0.1,100,200,400];
ac = [drugc.data.AUC(:,1),drugc.data.AUC(:,2),drugc.data.AUC(:,3),drugc.data.AUC(:,4)];

figure(1);
boxplot(ac,dose)
title('DrugC');
xlabel('Dosage');
mean_auc=[mean(drugc.data.AUC(:,1)) mean(drugc.data.AUC(:,2)) mean(drugc.data.AUC(:,3)) mean(drugc.data.AUC(:,4))];
Std_auc=[std(drugc.data.AUC(:,1)) std(drugc.data.AUC(:,2)) std(drugc.data.AUC(:,3)) std(drugc.data.AUC(:,4))];

%% Heatmap of drugc and drugn data
%% heatmap for drugc 
cheat = [drugc.data.AUC(:,1) drugc.data.AUC(:,2) drugc.data.AUC(:,3) drugc.data.AUC(:,4)];
figure(2)
imagesc(cheat);
title('Heatmap for DrugC Data');
colorbar
%% heatmap for drugn
nheat = [drugn.data.AUC(:,1) drugn.data.AUC(:,2) drugn.data.AUC(:,3) drugn.data.AUC(:,4)];
figure(3)
imagesc(nheat );
title('Heatmap for DrugN Data');
colorbar
%% Combined heatmap
Combined=[drugc.data.AUC(1:26,1) drugc.data.AUC(1:26,2) drugc.data.AUC(1:26,3) drugc.data.AUC(1:26,4) drugn.data.AUC(:,1) drugn.data.AUC(:,2) drugn.data.AUC(:,3) drugn.data.AUC(:,4)];
figure(4)
imagesc(Combined);
title('Combined Heatmap for DrugN and DrugC Data');
colorbar

