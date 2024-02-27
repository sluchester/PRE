clear all; close all; clc;

% pkg load statistics;

N = 1000000; % numero de realizacoes
beta = 100; % potencia media (mW)

X = exprnd(beta, 1,  N);

dx = 5;
% vetor que vai de -100 a 800 em passos de 5
x = -200 : dx : 800;

% .* => multiplicacao ponto a ponto entre vetores de mesmo tamanho
pdfX_teo = (1/beta) * exp(-x/beta) .* (x>=0)
pdfX_sim = hist(X, x)/(N*dx);

% PMF(discreto): hist/N
% PDF(contínuo): hist/(N*dx)
% CDF (Dist. Cumulativa): 

figure; hold on; grid on;
bar(x, pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth', 4);
xlim([-100, 700]);
xlabel('x'); ylabel('f_X(x)');

x0 = 10 %limiar  [mW]
Pr_teo = 1-exp(-x0/beta)
Pr_sim = mean(X <= x0)