N = 1e6; % número de repetições
alpha1 = 0.7; % exemplo: chance de encontrar no arquivo 1 se está lá

% gerar onde a carta realmente está
arquivo = randi(3, N, 1); 

% verificar busca no arquivo 1
encontrada = (arquivo == 1) & (rand(N,1) < alpha1);

% condicionar: não foi encontrada no arquivo 1
idx = ~encontrada;

% probabilidade da carta estar no arquivo 1 dado que não foi encontrada
prob_simulada = sum(arquivo(idx) == 1) / sum(idx);

disp(prob_simulada)
