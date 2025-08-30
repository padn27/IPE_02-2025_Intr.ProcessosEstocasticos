N = 1e6; % número de amostras
mu = 0;  % média de X
sigma = 1; % desvio padrão de X

X = mu + sigma*randn(N,1); % gera amostras de X
Y = X.^2; % eleva cada amostra ao quadrado

mean_est = mean(Y); % estima a média
true_value = sigma^2 + mu^2;

disp(['Média estimada: ', num2str(mean_est)]);
disp(['Valor verdadeiro: ', num2str(true_value)]);
