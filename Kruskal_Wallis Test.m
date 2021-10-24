%KRUSKAL WALLIS ANALYSIS AND PLOT
%In Part A, KW test has been carried out with 4 given machine samples for
%the tutorial problem. Manual calulations have been attached with the same.
%Part B highlightes KW analysis for drugc and drugn data.
%% Reading data for drugc, drugn and initialization of matrix.

drugc = importdata('drugc.xlsx');
drugn = importdata('drugn.xlsx');

%Initialize matrix data
matA=[25 10 40 27 15 ; 30 20 30 20 8 ; 16 33 49 35 45 ; 36 42 22 48 34];

fprintf('The given matrix as per the problem statement is : ')
matA

%Performing KW test
KWa = kruskalwallis(matA);
xlabel('Machine number','Fontsize',14);
ylabel('Replication','Fontsize',14);
title('PLOT Of KW test for given problem','Fontsize',14)
box off

%PartB
[drugc.data.Cmax(:,1) drugc.data.Cmax(:,2)]
drugCata = kruskalwallis([drugc.data.Cmax(:,1) drugc.data.Cmax(:,2) drugc.data.Cmax(:,3) drugc.data.Cmax(:,4)]);
drugCata
set(gca, 'XTickLabel',{'1','40','100','400'},'XTick',[1 2 3 4]);
xlabel('Drug concentration (ng/mL)','Fontsize',14);
ylabel('Cmax Data','Fontsize',14);
title('KW Test Plot for Drugc data','Fontsize',14)
box off


%Plot for Drugn data
[drugn.data.Cmax(:,1) drugn.data.Cmax(:,2) drugn.data.Cmax(:,3) drugn.data.Cmax(:,4)]
drugCata = kruskalwallis([drugn.data.Cmax(:,1) drugn.data.Cmax(:,2) drugn.data.Cmax(:,3) drugn.data.Cmax(:,4)]);
drugCata
set(gca, 'XTickLabel',{'1','40','100','400'},'XTick',[1 2 3 4]);
xlabel('Drug concentration (ng/mL)','Fontsize',14);
ylabel('Cmax Data','Fontsize',14);
title('KW Test Plot for Drugn data','Fontsize',14)
box off
