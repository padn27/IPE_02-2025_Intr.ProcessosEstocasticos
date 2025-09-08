clc; clear; close all;
syms t n p real

q = 1 - p;

% Função característica da Binomial
phiX = (q + p*exp(1i*t))^n;

% Primeiro e segundo momentos
EX = diff(phiX, t);         % E[X] = i*EX(0)
EX2 = diff(phiX, t, 2);     % E[X^2] = -EX2(0)

% Avaliando em t=0
EX_val = simplify(subs(1i*EX, t, 0))
EX2_val = simplify(subs(-EX2, t, 0))

% Variância
VarX = simplify(EX2_val - EX_val^2)
