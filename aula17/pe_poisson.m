clear all; clc; close all;
pkg load statistics;

N = 10000;
dt = 0.01; t = 0 : dt : 20; % vetor dos tempos
Nt = length(t);

lambda = 3.0; % eventos/s
X = zeros(N, Nt);

for i = 1 : N
    T = 0;
    while T < t(end)
        delta = rande() / lambda;
        T += delta;
        X(i,:) += t > T;
    end
end

figure; hold on; grid on;
for i =1 : 100
    stairs(t,X(i,:))
end