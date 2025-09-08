clear all

% Inicializar gerador moderno
rng(0,'twister');

M = 100000;
x = zeros(M,1);
y = zeros(M,1);

for m = 1:M
    u = rand;
    if u <= 1/8
        x(m) = 0; y(m) = 0;
    elseif u > 1/8 && u <= 1/4
        x(m) = 0; y(m) = 1;
    elseif u > 1/4 && u < 1/2
        x(m) = 1; y(m) = 0;
    else
        x(m) = 1; y(m) = 1;
    end
end

% Médias
EX = mean(x);
EY = mean(y);

% Variâncias (normalização por N)
varX = var(x,1);
varY = var(y,1);

% Covariância
covXY = mean(x.*y) - EX*EY;

% Correlação
rho = covXY / sqrt(varX*varY);

% Probabilidade conjunta (Phat)
Phat = zeros(2,2); % linhas X=0,1; colunas Y=0,1
Phat(1,1) = sum(x==0 & y==0)/M;
Phat(1,2) = sum(x==0 & y==1)/M;
Phat(2,1) = sum(x==1 & y==0)/M;
Phat(2,2) = sum(x==1 & y==1)/M;

% Exibir resultados
disp('Médias:')
disp(['EX = ', num2str(EX), ', EY = ', num2str(EY)])
disp('Variâncias:')
disp(['VarX = ', num2str(varX), ', VarY = ', num2str(varY)])
disp(['CovXY = ', num2str(covXY)])
disp(['Correlação rho = ', num2str(rho)])
disp('Matriz de probabilidades conjuntas Phat (linhas X=0,1; colunas Y=0,1):')
disp(Phat)
