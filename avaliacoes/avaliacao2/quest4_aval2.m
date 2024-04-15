clear all; close all; clc;
pkg load statistics;

N = 10; % Número de realizações

for i=1 : N
    %sortear as 3 variáveis aleatórias de Bernoulli
    B = rand(1,3) < 3/4;

    % soma das 3 Bernoullis
    X(i) = sum(B);
    % mínimo das 3 Bernoullis
    Y(i) = min(B);
end

x = [0 1 2 3];
y = [0 1];

pmfXY_sim = hist3([X' Y'], {x,y})/N
pmfXY_teo = [1/64 0; 9/64 0; 27/64 0; 0 27/64]

pmfX_sim = hist(X,x)/N
pmfX_teo = [1/64 9/64 27/64 27/64 27/64]

pmfY_sim = hist(Y,y)/N
pmfY_teo = [37/67 27/64]

figure; hold on; grid on;
bar(x, pmfX_sim, 'r');
stem(x, pmfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('p_X(x)');

% falta a parte condicional

figure;
bar(y, pmfY_sim, 'y');
stem(y, pmfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('p_Y(y)');