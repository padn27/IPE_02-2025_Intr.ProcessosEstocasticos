N = 1000; % número de amostras
X1 = randn(N,1); % gaussianas
X2 = randn(N,1);

Y1 = X1 + 0.1*X2;
Y2 = X1 + 0.2*X2;

figure;
scatter(Y1,Y2,'.');
xlabel('Y1'); ylabel('Y2');
title('Scatter diagram de Y1 vs Y2');

% Aproximar Y2 para Y1 = 1
X2_mean = mean(X2); % valor médio aproximado
Y2_est = 1 + 0.1*X2_mean;
disp(['Aproximação de Y2 para Y1=1: ', num2str(Y2_est)]);
