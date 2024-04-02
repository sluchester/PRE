% Avaliação 1 - Questão 4 - Luan de Barros

clear all; close all; clc;
pkg load statistics;

% A) esboço da PDF

% número de realizações
N = 100000;

% lançamento do dado por N vezes
U = randi([1 6],1,N);

% resultado das faces do dado
idx1 = U == 1;
idx2 = U == 2 | U == 3;
idx3 = U == 4;
idx4 = U == 5 | U == 6;

% preenche a matrix X de 1 linha e N colunas com 0
X = zeros(1,N);

% valor atribuído para X dependendo do resultado das faces do dado
X(idx1) = 10;
X(idx2) = 5;
X(idx3) = 0;
X(idx4) = unifrnd(0,20,1,sum(idx4));

dx= 1/5; x=0:dx:20;

% PDF
pdfX_sim = (hist(X,x) / (N*dx));
pdfX_teo = (1/60) .* (0 < x & x < 20); % sem os impulsos

% CDF
cdfX_sim = cumsum(pdfX_sim)*dx;
cdfX_teo = 0            .* (x < 0) + ...
            (1/6 + x/60) .* (0 <= x & x < 5) + ...
            (35/60 + ((x-5)/60)) .* (5 <= x & x < 10) + ...
            (50/60  + ((x-10)/60)) .* (10 <= x && x < 20);

figure;
subplot(2,1,1); hold on; grid on;
bar(x,pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth',4);

%  representando os impulsos
plot([10, 10], [0, 1/6], 'b', 'LineWidth', 3');
plot([10], [1/6], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
plot([5, 5], [0, 1/3], 'b', 'LineWidth', 3');
plot([5], [1/3], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
plot([0, 0], [0, 1/6], 'b', 'LineWidth', 3');
plot([0], [1/6], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
xlim([0 20]); ylim([0 1/3]);
xlabel('X'); ylabel('f_X(x)');

subplot(2,1,2); hold on; grid on;
plot(x, cdfX_sim, 'r', 'LineWidth', 4);
plot(x,cdfX_teo, 'b--', 'LineWidth', 2)
xlim([0 20]); ylim([50/60,1/6]);
xlabel('X'); ylabel('F_X(x)');