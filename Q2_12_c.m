% Parâmetros das variáveis gaussianas
mu1 = 0; sigma1 = 1;
mu2 = 0; sigma2 = 1;
N = 1e6; % número de amostras

% Gerar amostras
X1 = mu1 + sigma1*randn(N,1);
X2 = mu2 + sigma2*randn(N,1);

% Subtração
Y = X1 - X2;

% Estimativa dos desvios padrões
std_X1 = std(X1);
std_X2 = std(X2);
std_Y  = std(Y);

disp(['Desvio padrão X1: ', num2str(std_X1)]);
disp(['Desvio padrão X2: ', num2str(std_X2)]);
disp(['Desvio padrão Y = X1-X2: ', num2str(std_Y)]);

% Histogramas para visualização
edges = -6:0.1:6;
figure;
histogram(X1, edges, 'Normalization', 'pdf', 'FaceAlpha',0.5, 'FaceColor','b'); hold on;
histogram(X2, edges, 'Normalization', 'pdf', 'FaceAlpha',0.5, 'FaceColor','r');
histogram(Y, edges, 'Normalization', 'pdf', 'FaceAlpha',0.5, 'FaceColor','g');
xlabel('Valor'); ylabel('PDF');
legend('X1','X2','Y = X1 - X2');
title('Comparação de distribuições gaussianas e da diferença');
