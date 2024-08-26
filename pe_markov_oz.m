clear all; close all; clc;
pkg load statistics;

N = 2000;  % Número de realizações
nmax = 10;  % Último instante de tempo

S = [1 2 3]; % Espaço de estados
p0 = [0 1 0];  % PMF inicial
P = [1/2 1/4 1/4;  % Matriz de transição
     1/2  0  1/2;
     1/4 1/4 1/2];

X = zeros(N, nmax+1);
for i = 1 : N
  X(i, 1) = discrete_rnd(S, p0, 1);
  for n = 1 : nmax
    X(i, n+1) = discrete_rnd(S, P(X(i, n), :), 1);
  end
end

pn_sim = hist(X, S) / N;

pn_teo = zeros(length(S), nmax+1);
for n = 0 : nmax
  pn_teo(:, n+1) = p0 * P^n;
end

% feito dois fors por causa da legenda
figure; hold on; grid on;
for i = 1 : length(S)
  plot(0:nmax, pn_sim(i, :), 'o-', 'LineWidth', 2)
end
for i = 1 : length(S)
  plot(0:nmax, pn_teo(i, :), 'k--')
end
legend('Chuva', 'Sol', 'Neve');
xlabel('n'); ylabel('p_n');
