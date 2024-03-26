clear all; close all; clc;
pkg load statistics;

N = 30000 %;

X = zeros(1,N);
Y = zeros(1,N);

for i=1 : N
    do
        X(i) = 2*rand()-1;
        Y(i) = 2*rand()-1;
    until X(i)^2 + Y(i)^2 <= 1

end

dx = 0.05; x = -1.2 : dx : 1.2;
dy = 0.05; y = -1.2 : dy : 1.2;

[xx,yy] = meshgrid(x,y);
pdfXY_teo = (1/pi) * (xx.^2 + yy.^2 <=1);

figure; hold on; grid on;
scatter(X(1:20000),Y(1:20000));
axis('square');
xlabel('x'); ylabel('y');

figure; hold on; grid on;
surf(xx,yy,pdfXY_teo);
view(45,30);
xlabel('x'); ylabel('y'); zlabel('f_(X,Y)(x,y))');