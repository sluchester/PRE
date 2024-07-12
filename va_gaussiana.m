clear all; close all; clc;
pkg load statistics;

N = 1000000;

mu = 5;
sigma = 4;

X = randn(1,N)*sigma + mu;
dx = 0.5;
x = mu - 4*sigma : dx : mu + 4*sigma;

pdfX_teo = 1/sqrt(2*pi*sigma^2)*exp(-(x-mu).^2/(2*sigma^2));
pdfX_sim = hist(X,x)/(N*dx);

figure;hold on; grid on;
bar(x,pdfX_sim, 'y');
plot(x,pdfX_teo,'b','LineWidth',4);

% Pr[7 <= X <= 12]
Pr_teo = normcdf((12-mu)/sigma) - normcdf((7-mu)/sigma)
Pr_sim = mean(7 <= X & X <= 12)