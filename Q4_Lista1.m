% Número de simulações
N = 1e6;

% Gerando 10 variáveis uniformes por simulação
U = rand(N, 10);

% Somando para obter Y
Y = sum(U, 2);

% Definindo os intervalos de 0 a 10 com passo 0.5
edges = 0:0.5:10;

% Calculando histograma normalizado para obter probabilidades
counts = histcounts(Y, edges);
probabilities = counts / N;

% Exibindo os resultados
intervals = strcat("[", string(edges(1:end-1)), ", ", string(edges(2:end)), ")");
table(intervals', probabilities', 'VariableNames', {'Interval', 'Probability'})
