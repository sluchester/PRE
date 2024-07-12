% Avaliação 3 - Questão 7 - Luan de Barros

clc; close all; clear all;

% numero de realizações
N = 1000000;

X = zeros(1, N);
Y = zeros(1, N);

% laço de N repetições
i = 1;
while i <= N
    % Interválo contínuo de 0 a 20
    X(i) = 20 * rand();
    % Interválo contínuo de 0 a 20
    Y(i) = 20 * rand();
    
    if (0 <= X(i) && X(i) <= 20 && 0 <= Y(i) && Y(i) <= 20 && - X(i) + 10 <= Y(i) && Y(i) <= -X(i) + 30)
        i = i + 1;
    end
end

%-------------------------------------------------------------------------------------------------------
% b) Pr[X >= Y]

% Calculando a probabilidade de X ser maior ou igual a Y
PrX_maior_ou_igual_Y_sim = mean(X >= Y)
% Probabilidade teórica de X ser maior ou igual a Y (obtida via cálculo)
PrX_maior_ou_igual_Y_teo = 7/12

%--------------------------------------------------------------------------------------------------------
% c) Determine e esboce a PDF marginal de Y

dy = 0.5; y = 0 : dy : 20;

pdfY_sim = hist(Y,y) / (N*dy);
pdfY_teo = (1/15) .* (0 <= y & y <= 10) + ...
            ((-y + 20)/150) .* (10  < y & y < 20);

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y');
plot(y, pdfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('f_Y(y)'); title('PDF Marginal de Y')

%--------------------------------------------------------------------------------------------------------
% d) Determine e esboce a CDF marginal de Y

cdfY_sim = cumsum(pdfY_sim) * dy;
cdfY_teo = (y/15) .* (0 <= y & y <= 10) + ...
            (-(y.^2)/300 + (2*y)/15 - 1/3) .* (10 < y & y < 20) + ...
            1 .* (20 <= y);

subplot(3, 1, 2); grid on; hold on;
bar(y, cdfY_sim, 'y');
plot(y, cdfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('F_Y(y)'); title('CDF Marginal de Y')

%--------------------------------------------------------------------------------------------------------
% e) Determine e esboce a PDF condicional de Y dado X = 5;

idx = (4 <= X) & (X <= 6);
Y_condX = Y(idx);
pdfY_condX_sim = hist(Y_condX, y)/(length(Y_condX)*dy);
pdfY_condX_teo = (1/30) .* (0 <= y & y <= 15); % x+10

subplot(3, 1, 3); grid on; hold on;
bar(y, pdfY_condX_sim, 'y');
plot(y, pdfY_condX_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('F_Y(y / X = 5)');title('PDF condicional de Y, dado que X é 5')

%--------------------------------------------------------------------------------------------------------
% f) Determine a covariância entre X e Y

covXY_sim = cov(X,Y)
covXY_teo = -481.6063;