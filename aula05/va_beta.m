clear all; close all; clc;

N = 10000;

X = rand(1,N);
Y = X .^2

dx=0.01; 
x= -0.2 : dx : 1.2;

dy=0.01; 
y= -0.2 : dy : 1.2;

pdfX_teo = 0 <= x & x <=1 ;
pdfX_sim = hist(X,x)/(N*dx);

pdfY_teo = (0.5 ./ sqrt(y)) .* (0 <= y & y <= 1);
pdfY_sim = hist(Y,y)/(N*dy);

figure; hold on; grid on;
bar(x, pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth', 4)
xlabel('y'); ylabel('f_Y(y)');

EX_teo = 1/2
EX_sim = mean(X)