clear all; close all; clc;

N = 10;

t = 3; % Número de estados transientes
r = 2; % Número de estados absorventes
S = 1 : (t+r); % Espaço de estados

% 1-C1, 2-C2, 3-C3, 4-H, 5-B

Q = [0 1/2 0;
    1/2 0 1/2;
    0 1/2 0];
R = [1/2 0;
    0 0;
    0 1/2];

P = [Q R;
    zeros(r,t) eye(r)
];
% TEORIAA

NN = inv(eye(t)-Q);
tt = NN * ones(t,1);
B_teo = NN * R

% Simulação de Monte Carlo
B_sim = zeros(t,r);
for si = 1 : t
    X = {};
    for i = 1:N
        X{i} = [si];
        n = 1;
        while X{i}(n) <= t
            X{i}(n+1) = discrete_rnd(S, P(X{i}(n),:),1);
            n += 1;
        end
    end
    Sf = zeros(1,N);
    for i = 1:n
        Sf(i) = X{i}(end);
    end
    Sf
end