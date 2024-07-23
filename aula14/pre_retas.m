clear all; close all; clc;

N = 1000000;
dt = 0.05; t = 0 : dt : 1; %vetor dos tempos
dx = 0.02; x = -0.2 : dx : 1.2; % começar antes para ver que realmente está no 0 do gráfico

% cada linha será uma realização diferente
% cada coluna é um instante de tempo

X = zeros(N,length(t));
for i = 1 : N
    A = rand();
    B = rand();
    X(i, :) = (B-A)*t + A;
    % pause
end

# figure; hold on; grid on;
# plot(t, X(1:400, :));
# xlabel('t'); ylabel('X(t)');

t0 = 0.5;
idx = round((t0 - t(1)) / dt) + 1
pdfX_sim = hist(X(:, idx), x) / (N * dx);
figure; hold on; grid on;
bar(x, pdfX_sim, 'y');
xlabel('x'); ylabel(sprintf('f_{X(%g)}(x)', t0));