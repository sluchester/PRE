clear all; close all; clc;

N = 10;
dt = 0.02; t = -1 : dt : 1;
Nt = length(t);

a=1;
b=2;
f0=1;

X = zeros(N,Nt);
for i  = 1:N
    THETA = 2*pi*(rand() - 0.5);
    X(i,:) = a * cos(2*pi*f0*t - THETA) + b;
end

figure; hold on; grid on;
plot(t,X(1:10,:));
xlabel('t'); ylabel('X(t)');

muX_teo = b * ones(1,Nt);
muX_sim = mean(X);

figure; hold on; grid on;
plot(t, muX_sim, 'mo', 'LineWidth', 6);
plot(t, muX_teo, 'b', 'LineWidth', 4);
xlabel('t'); ylabel('\mu_X(t)');
ylim([1 3]);

[T1, T2] = meshgrid(t,t);
CX_teo = 0.5*a^2*cos(2*pi*f0*(T2-T1));
CX_sim = cov(X,X);

figure;
subplot(1,2,1); grid on; hold on;
surf(t,t,CX_teo);
shading flat;
subplot(1,2,2); grid on; hold on;
surf(t,t,CX_sim);