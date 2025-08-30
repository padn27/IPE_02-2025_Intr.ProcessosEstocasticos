N = 1e6; % número de amostras
r = rand(N,1); % gera números uniformes entre 0 e 1
X = zeros(N,1);

% Mapear valores com base nas probabilidades cumulativas
X(r <= 0.1) = 1;          % 10% de chance
X(r > 0.1 & r <= 0.3) = 2; % 20% de chance
X(r > 0.3) = 3;            % 70% de chance

% Estimar probabilidades
p_est = [mean(X==1), mean(X==2), mean(X==3)];

disp('Probabilidades estimadas de X:');
disp(p_est);
