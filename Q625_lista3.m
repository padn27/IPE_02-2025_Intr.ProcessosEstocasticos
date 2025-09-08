clc; clear; close all;
syms k n integer

% Definindo PMF simétrica genérica
syms p [1 3] real % exemplo com 3 pontos: -1,0,1
assumeAlso(p >= 0);
px = [p(1), p(2), p(3)];
k_vals = [-1 0 1];

% Momento de ordem n
Xn = sum(k_vals.^n .* px);

% Mostrar resultado para n ímpar
disp('Momento de ordem ímpar:');
simplify(subs(Xn, n, 1))   % n=1
simplify(subs(Xn, n, 3))   % n=3
