clear all; close all; clc;

N = 10000; % Numero de realizações

D1 = randi([1 6], 1, N);  % ; omite a saida
D2 = randi([1 6], 1, N);

% vetor em que cada elemento é a somatória de resultados (e não a variavel aleatoria)
X = D1 + D2;

% todos os valores que a variavel pode assumir
% definição de um vetor
x = 2 : 12;

pmfX_teorica = [1 2 3 4 5 6 5 4 3 2 1]/36;
% estimativa da real probabilidade que está entre 0 e 1
pmfX_sim = hist(X,x) / N;

% figure;
% plot(x, pmfX_teorica)

figure; hold on; grid on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teorica, 'b', 'LineWidth', 3);
xlabel('x'); ylabel('p_X(x)');

Pr_primo_teo = 15/36
% funcao que calcula a media
Pr_primo_sim = mean((X == 2) | (X==3)| (X==5) | (X==7) | (X==11))

% format compact
