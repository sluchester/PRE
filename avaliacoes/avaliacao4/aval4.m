% Avaliação 3 - Questão 7 - Luan de Barros

clc; close all; clear all;

% numero de realizações
N = 1000000;

X1 = 3*rand(1,N);
X2 = 3*rand(1,N);

Y1 = X1.^2; 
Y2 = X2.^2;
Y3 = X1.*X2;

Z1 = Y1;
Z2 = Y1 + Y2;
Z3 = Y1 + Y2 + Y3;

% Letra A
% Vetor média de Y
VetMediaY_sim = mean([Y1' Y2' Y3'])'
VetMediaY_teo = [3;3;9/4]

% Matriz covariância de Y
MatrizCovY_sim = cov([Y1' Y2' Y3'])'
MatrizCovY_teo = [66/5, 0, 27/8;
                  0, 66/5, 27/8;
                  27/8, 27/8,63/16]

% Letra B
% Vetor média de Z
VetMediaZ_sim = mean([Z1' Z2' Z3'])'
VetMediaZ_teo = [3,6,33/4]'

% Matriz covariância do vetor aleatório Z
MatrizCovZ_sim = cov([Z1' Z2' Z3'])'
MatrizCovZ_teo = [66/5, 66/5, 66/5;
                  66/5, 132/5, 132/5;
                  663/40, 663/20, 663/20]