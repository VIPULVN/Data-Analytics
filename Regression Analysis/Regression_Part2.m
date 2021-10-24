y=[1.70326;1.60172 ; 1.50018; 1.39864; 1.2971; 1.19556; 1.09402; 0.9924; 0.89094; 0.7894; 0.6878; 0.58630];
Year=[1 ;2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12];
fatality=[2.419;1.732;1.361;1.108;0.996;0.952;0.904;0.792;0.701;0.890;0.799;1.084];
X2 = [ones(size(Year)) Year fatality];
c = regress(y,X2)
%Where c denotes magnitude of alpha and beta
scatter3(Year,fatality,y,'filled')