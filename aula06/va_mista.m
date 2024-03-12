clear all; close all; clc;

N = 10;

U = 4*rand(1,N);
X = zeros(1,N);

idx1 = U <= 1;
idx2 = U > 1;
X(idx) = 2* rand(1, sum(idx1));
X(idx2) = rand(1, sum(idx2)) < 2/3;

dx = 0.01;
x= -0.5 : dx: 2.5;

pdfX_teo = 0; % TODO
pdfX_sim = hist(X,x)/(N*dx);

cdfX_teo = 0 %TODO
cdfX_sim = cumsum(pdfX_sim)*dx;

figure; hold on; grid on;



Ex_teo = 0 % TODO
Ex_sim = mean(x)
