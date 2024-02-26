clear all; close all; clc;

N = 10000; % numero de realizacoes
p = 2/3;
%p = 0.1; % probabilidade de sucesso

% permanece no laco ate que a condicao seja verdadeira
X = zeros(1,N);
for i = 1:N
    do
        X(i)+=1;
    until rand() < p
end

%x = 1:10
x = 1:round(8/p);

pmfX_teo = (1 - p) .^(x-1)*p;
pmfX_sim = hist(X,x)/N;

figure; hold on; grid on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teo, 'b', 'LineWidth', 3);
xlabel('x'); ylabel('p_X(x)');

Pr_3transmissoes_teo = 2/3 + 2/9 + 2/27
Pr_3transmissoes_sim = mean(X <= 3)