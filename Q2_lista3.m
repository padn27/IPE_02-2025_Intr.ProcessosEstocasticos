clc; clear; close all;
rng(1); 

N = 10000;

% --- 1) Uniforme discreto k=-1..1 (M=1) e escala s = sqrt(3/2)
k_unif = -1:1;
pmf_unif = ones(size(k_unif))/numel(k_unif);
X_unif_raw = randsample(k_unif, N, true, pmf_unif);
s_unif = sqrt(3/2);
X_unif = s_unif * X_unif_raw;

% --- 2) Bernoulli p=0.5, escala s=2 to get var 1
p = 0.5;
X_ber_raw = rand(N,1) < p;
s_ber = 1/sqrt(p*(1-p)); % =2
X_ber = s_ber * X_ber_raw;

% --- 3) Binomial n=4, p=0.5 (var = 1 already)
n_bin = 4; p_bin = 0.5;
X_bin = binornd(n_bin, p_bin, N, 1);

% --- 4) Geométrica p = (sqrt(5)-1)/2 var=1 (k=1,2,...)
p_geo = (sqrt(5)-1)/2;
u = rand(N,1);
X_geo = ceil(log(1-u)/log(1-p_geo)); % produces k>=1

% --- 5) Poisson lambda=1
lambda = 1;
X_poi = poissrnd(lambda, N, 1);

X_list = {X_unif(:), X_ber(:), X_bin(:), X_geo(:), X_poi(:)};
names = {'Uniform discrete (-1..1) scaled','Bernoulli p=0.5 scaled','Binomial(4,0.5)','Geometric(p~0.618)','Poisson(1)'};

for idx = 1:numel(X_list)
    X = X_list{idx};
    X = X(:);
    Y = 7*X - 0.5;
    
    % estimadores amostrais
    EX_hat = mean(X);
    EY_hat = mean(Y);
    CovXY_hat = cov(X,Y); CovXY_hat = CovXY_hat(1,2);
    VarX_hat = var(X);
    
    % estimador linear
    Yhat = EY_hat + (CovXY_hat/VarX_hat).*(X - EX_hat);
    
    % erro
    Eerr = Y - Yhat;
    
    % estatísticas
    mean_err = mean(Eerr);
    var_err = var(Eerr);
    max_abs_err = max(abs(Eerr));
    
    fprintf('--- %s ---\n', names{idx});
    fprintf('E[X]ˆ = %.6f, E[Y]ˆ = %.6f, Covˆ(X,Y)= %.6f, Varˆ(X)= %.6f\n', EX_hat, EY_hat, CovXY_hat, VarX_hat);
    fprintf('Erro médio (E) = %.4e, Var(E) = %.4e, max |E| = %.4e\n\n', mean_err, var_err, max_abs_err);
    
    figure;
    histogram(Eerr,100);
    title(sprintf('Histograma do erro E = Y - Yhat (%s)', names{idx}));
    xlabel('Erro'); ylabel('Frequência');
end
