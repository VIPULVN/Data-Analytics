G=[73;87;83;78;82;80;83;86;75;82;80;82;77;81;79;78;76;80;80;81];
H=[7.3;-6.0;-3.7;2.5;-2.2;0.7;-2.9;-6.2;5.1;-1.3;0.8;-2.4;2.9;-1.5;1.1;1.9;3.5;0.5;-0.3;-0.6];
Y=[3096;3519;3383;3261;3360;3334;3388;3481;3120;3378;3326;3365;3215;3306;3266;3229;3193;3315;3280;3335];

h2=sum(H.*H);
g2=G.*H;
g2=sum(g2.*h2);
a=sum(Y.*g2);
a;
G.*H;
%G=[73; 87; 83];
%H=[7.3 ;-6 ;-3.7];
%Y=[3096 ;3519; 3383];

X = [ones(size(G)) G H];
b = regress(Y,X)
scatter3(G,H,Y,'filled')
hold on
x1fit = min(G):100:max(G);
x2fit = min(H):10:max(H);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit); 
%YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
%mesh(X1FIT,X2FIT,YFIT)
xlabel('G')
ylabel('H')
zlabel('Y')
view(50,10)
