clear all; close all; clc;

N=100000;

dx = 0.05; x = -0.2 : dx : 1.2;

% format  shortg
% format rat
U = rand(3,N);
X = sort(U);

pdfU1 = hist(U(1,:), x) / (N*dx);
pdfU2 = hist(U(2,:), x) / (N*dx);
pdfU3 = hist(U(3,:), x) / (N*dx);
pdfX1 = hist(X(1,:), x) / (N*dx);
pdfX2 = hist(X(2,:), x) / (N*dx);
pdfX3 = hist(X(3,:), x) / (N*dx);

figure;
subplot(2,3,1); grid on; hold on;
bar(x, pdfU1);
xlabel('u'); ylabel('f_{U_1}(u)');

subplot(2,3,2); grid on; hold on;
bar(x, pdfU2);
xlabel('u'); ylabel('f_{U_2}(u)');

subplot(2,3,3); grid on; hold on;
bar(x, pdfU3);
xlabel('u'); ylabel('f_{U_3}(u)');

subplot(2,3,4); grid on; hold on;
bar(x, pdfX1);
xlabel('u'); ylabel('f_{X_1}(x)');

subplot(2,3,5); grid on; hold on;
bar(x, pdfX2);
xlabel('u'); ylabel('f_{X_2}(u)');

subplot(2,3,6); grid on; hold on;
bar(x, pdfX3);
xlabel('u'); ylabel('f_{X_3}(u)');

muU_teo = [1/2; 1/2; 1/2]
muU_sim = mean(U')'

covU_teo = (1/12    0       0;
            0       1/12    0;
            0       0       1/12)
covU_sim = 