clear all; close all; clc;
pkg load statistics;

N = 1000000;  % Número de realizações

mu = [0; 0; 0];  % Vetor média
C = [3 3 0; 3 5 0; 0 0 6];  % Matriz covariância

vetX = mvnrnd(mu, C, N);
X = vetX(:, 1)';
Y = vetX(:, 2)';
Z = vetX(:, 3)';

% (a) Apenas f_{X,Y}

dx = 0.2; x = -9 : dx : 9;
dy = 0.2; y = -9 : dy : 9;
[xx, yy] = meshgrid(x, y);

pdfXY_sim = hist3([X' Y'], {x, y})' / (N * dx * dy);
pdfXY_teo = 1 / sqrt((2*pi)^2 * 6) * exp(-0.5 * (5*xx.^2 - 6*xx.*yy + 3*yy.^2)/6);

figure;
subplot(1, 2, 1); hold on; grid on; axis square;
surf(xx, yy, pdfXY_sim);
xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x,y)');
subplot(1, 2, 2); hold on; grid on; axis square;
surf(xx, yy, pdfXY_teo);
xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x,y)');

% (b)

dw = 0.5; w = -20 : dw : 30;
W = X + 2*Y - Z + 5;

pdfW_sim = hist(W, w) / (N * dw);
pdfW_teo = 1 / sqrt(2*pi*41) * exp(-(w - 5).^2 / (2*41));

figure; hold on; grid on;
bar(w, pdfW_sim, 'y');
plot(w, pdfW_teo, 'b', 'LineWidth', 4);
xlabel('w'); ylabel('f_W(w)');
xlim([-20, 30])

% (c)

pdfX_sim = hist(X, x) / (N * dx);
pdfX_teo = 1 / sqrt(2*pi*3) * exp(-x.^2 / (2*3));

Xcond = X(0.9 < Y & Y < 1.1);
pdfXcond_sim = hist(Xcond, x) / (length(Xcond) * dx);
pdfXcond_teo =  1 / sqrt(2*pi*1.2) * exp(-(x - 0.6).^2 / (2*1.2));

figure;
subplot(1, 2, 1); hold on; grid on;
bar(x, pdfX_sim, 'y');
plot(x, pdfX_teo, 'b', 'LineWidth', 4);
xlim([-9 9]); ylim([0, 0.4]);
xlabel('x'); ylabel('f_X(x)');
title('A Priori');
ylim([0,0.4]);
subplot(1, 2, 2); hold on; grid on;
bar(x, pdfXcond_sim, 'y');
plot(x, pdfXcond_teo, 'b', 'LineWidth', 4);
xlim([-9 9]); ylim([0, 0.4]);
xlabel('x'); ylabel('f_{X \mid Y=1)(x)');
title('A Posteriori');
ylim([0,0.4]);

% (d)

Xcond = X(2.9 < Z & Z < 3.1);
Pr_d_sim = mean(0 <= Xcond & Xcond <= 1)
Pr_d_teo = normcdf(1 / sqrt(3)) - normcdf(0)