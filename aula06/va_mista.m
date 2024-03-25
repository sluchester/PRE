clear all; close all; clc;

N = 1000000;

U = 4*rand(1,N);
X = zeros(1,N);

idx1 = U <= 1;
idx2 = U > 1;
X(idx1) = 2* rand(1, sum(idx1));
X(idx2) = rand(1, sum(idx2)) < 2/3;

dx = 0.01;
x= -0.5 : dx: 2.5;

pdfX_teo = (1/8) * (0 <= x && x <= 2); % sem os impulsos
pdfX_sim = hist(X,x)/(N*dx);

cdfX_teo = 0 %TODO
cdfX_sim = cumsum(pdfX_sim)*dx;

figure; 
subplot(2, 1, 1); hold on; grid on;
bar(x, pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth', 4);
% desenhando os impulsos
plot([0,0], [0,1/4], 'b', 'LineWidth', 4);
plot([0],[1/4], 'b^','MarkerSize', 12, 'MarkerFaceColor', 'b');
plot([1,1], [0,1/2], 'b', 'LineWidth', 4);
plot([0],[1/4], 'b^','MarkerSize', 12, 'MarkerFaceColor', 'b');

hold on; grid on;
xlabel('x'); ylabel('f_X(x)');



Ex_teo = 0 % TODO
Ex_sim = mean(x)
