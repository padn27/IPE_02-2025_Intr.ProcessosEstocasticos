Nsim = 1e6; % número de simulações
n = 12;     % número de termos na soma

% Gerar U_i uniformes
U = rand(Nsim,n);

% Calcular X
X = sum(U - 0.5, 2); % soma ao longo das colunas

% Estimar PDF usando histograma normalizado
edges = linspace(min(X), max(X), 100); % 100 bins
counts = histcounts(X, edges, 'Normalization', 'pdf'); 
centers = edges(1:end-1) + diff(edges)/2;

% Plotar PDF estimada
figure;
bar(centers, counts, 'hist');
hold on;

% Plotar PDF Gaussiana padrão para comparação
x = linspace(min(X), max(X), 200);
y = (1/sqrt(2*pi)) * exp(-x.^2/2);
plot(x, y, 'r', 'LineWidth', 2);
xlabel('X');
ylabel('PDF');
legend('Estimativa via simulação', 'PDF Gaussiana padrão');
title('Estimativa do PDF de X e comparação com Gaussian');
grid on;
