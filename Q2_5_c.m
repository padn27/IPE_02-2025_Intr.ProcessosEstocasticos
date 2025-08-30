Nsim = 1e6;
U1 = rand(Nsim,1);
U2 = rand(Nsim,1);
X = U1 - U2;

% Histograma PDF
edges = -1:0.02:1;
counts = histcounts(X, edges, 'Normalization', 'pdf');
centers = edges(1:end-1) + diff(edges)/2;

% Plot PDF
figure;
bar(centers, counts, 'hist');
xlabel('X'); ylabel('PDF');
title('Estimativa da PDF de X = U1 - U2');
hold on;

% Destacar intervalo mais provável
% Considerando intervalo central de -0.5 a 0.5
prob_interval = [-0.5 0.5];
y_lim = ylim; % limites do eixo y
patch([prob_interval(1) prob_interval(2) prob_interval(2) prob_interval(1)], ...
      [0 0 y_lim(2) y_lim(2)], ...
      [1 0.9 0.8], 'FaceAlpha',0.3, 'EdgeColor','none'); % destaque em transparência

legend('PDF estimada','Intervalo mais provável');
