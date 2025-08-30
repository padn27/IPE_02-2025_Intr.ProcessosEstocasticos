N = 1e6; % número de amostras
mu = 0;  % média de X
sigma = 1; % desvio padrão de X

X = mu + sigma*randn(N,1); % gera amostras de X
Y = X + 1; % variável X+1

mean_est = mean(Y); % estima a média
true_value = mu + 1;

disp(['Média estimada: ', num2str(mean_est)]);
disp(['Valor verdadeiro: ', num2str(true_value)]);
