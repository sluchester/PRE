clear all; close all; clc;
pkg load statistics;

N=10000; % numero de realizacoes
X = randi([1 3],1,N);
Y = zeros(1,N);

x = 1:3;
y = 0:3;

for i = 1 :N
    Y(i) = sum(randi([0 1], 1, X(i)));
end

pmfXY_teo = [1/6 1/6 0 0;
            1/12 2/12 1/12 0;
            1/24 3/24 3/24 1/24]

pmfXY_sim = hist3([X' Y'], {x,y})/N

covXY_teo = 1/3
covXY_sim = cov(X,Y)