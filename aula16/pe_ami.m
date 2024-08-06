clear all; close all; clc;

N = 10000; % numero de realizacoes
n = -5 : 5; % vetor dos tempos (discreto)
Na = length(n); % numero de amostras temporais

X = zeros(N,Na);
for i = 1: N
    B = randi([0 1], 1, Na);
    idx = find(B);
    L = length(idx);
    X(i,idx) = (-1).^(1:L);
end

figure;
for i = 1 : 4
    subplot(2,2,i); hold on; grid on;
    stem(n,X(i,:));
end

muX_teo = zeros(1,Na);
muX_sim = mean(X);

figure; hold on; grid on;
stem(n, muX_teo, 'b');
stem(n, muX_sim, 'r');
ylim([-0.75 0.75]);

CX_teo = diag(0.5*ones(1,Na)) + ...
        diag(-0.25*ones(1,Na-1),1) + ...
        diag(-0.25*ones(1,Na-1),-1);

CX_sim = cov(X,X);
figure; hold on; grid on;
stem(n,CX_teo((Na+1)/2, :), 'b');
stem(n,CX_sim((Na+1)/2, :), 'r');