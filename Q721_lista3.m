% PMF conjunta
a = 3/8; b = 1/8; c = 1/8; d = 3/8;

% Verificando a condição ad = bc
lhs = a*d;  % ad
rhs = b*c;  % bc

disp(['a*d = ', num2str(lhs)])
disp(['b*c = ', num2str(rhs)])

if abs(lhs - rhs) < 1e-10
    disp('Variáveis possivelmente independentes')
else
    disp('Variáveis NÃO independentes')
end

% Também podemos checar a independência usando marginais
px = [a+b, c+d];  % P_X[0], P_X[1]
py = [a+c, b+d];  % P_Y[0], P_Y[1]

% Teste completo: verificar se PXY = PX*PY
PXY = [a b; c d];
PX_PY = px' * py;  % produto externo

disp('PXY calculado:')
disp(PXY)
disp('Produto das marginais PX*PY:')
disp(PX_PY)
