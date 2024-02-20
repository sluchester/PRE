clear all; close all; clc;

N = 10; % Numero de realizações

D1 = randi([1 6], 1, N);  % ; omite a saida
D2 = randi([1 6], 1, N);

% vetor em que cada elemento é a somatória de resultados (e não a variavel aleatoria)
X = D1 + D2;

% todos os valores que a variavel pode assumir
% definição de um vetor
x = 2 : 12;

pmfX_teorica = [1 2 3 4 5 6 5 4 3 2 1]/36;

% figure;
% plot(x, pmfX_teorica)

figure; hold on; grid on;
stem(x, pmfX_teorica)
xlabel('x'); ylabel('p_X(x)');

% aula que vem
pmfX_sim = 0;

% format compact