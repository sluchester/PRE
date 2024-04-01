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

dx= 1/3; x=0:dx:20;

pdfX_sim = hist(X,x) / (N*dx);
pdfX_teo = %TODO HERE

figure;
subplot(2,1,1); hold on; grid on;
xlim([0 20]); ylim([0 1/3];)
xlabel('X'); ylabel('PDF_(X)');
title('PDF');
bar(x,pdfX_sim);