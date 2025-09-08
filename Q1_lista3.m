clc; clear; close all;

% Parâmetros
m = 10;               % número de vértices - 1 (total = m+1)
Nsim = 10000;         % número de simulações
V = m+1;

% Contadores
ultimo_contador = zeros(1, V);
tempos_primeira = zeros(Nsim, V); % tempo de primeira visita de cada vértice
cover_times = zeros(Nsim,1);      % tempo até cobrir todos

% Guardar uma realização exemplificativa
serie_temporal_exemplo = [];

for sim = 1:Nsim
    visitados = false(1, V);
    pos = 1;                % índice 1 representa vértice 0
    visitados(pos) = true;
    tempo_visita = inf(1, V);
    tempo_visita(pos) = 0;
    
    ordem = pos;
    t = 0;
    while ~all(visitados)
        t = t + 1;
        if rand < 0.5
            pos = pos - 1;
        else
            pos = pos + 1;
        end
        % ajuste circular
        if pos < 1
            pos = V;
        elseif pos > V
            pos = 1;
        end
        
        ordem(end+1) = pos;
        if ~visitados(pos)
            visitados(pos) = true;
            tempo_visita(pos) = t;
        end
    end
    
    % Registrar resultados
    ultimo = ordem(end);
    ultimo_contador(ultimo) = ultimo_contador(ultimo) + 1;
    tempos_primeira(sim,:) = tempo_visita;
    cover_times(sim) = t;
    
    if sim == 1
        serie_temporal_exemplo = ordem;
    end
end

% Probabilidades estimadas para cada vértice ser o último
probabilidades = ultimo_contador / Nsim;

fprintf('Probabilidade estimada de cada vértice ser o último (vértices 1...m):\n');
for i = 2:V
    fprintf('Vértice %d: %.4f (teórico 1/%.0f = %.4f)\n', i-1, probabilidades(i), m, 1/m);
end

% Erro padrão para as probabilidades (aprox. binomial)
stderr = sqrt(probabilidades.*(1-probabilidades)/Nsim);
fprintf('\nExemplo de erro padrão (vértice 1...m):\n');
for i = 2:V
    fprintf('V%d: se = %.4f\n', i-1, stderr(i));
end

% Estatísticas dos tempos de primeira visita por vértice
fprintf('\nTempos de primeira visita (por vértice)\n');
for i = 2:V
    media = mean(tempos_primeira(:,i));
    variancia = var(tempos_primeira(:,i));
    fprintf('Vértice %d: E[T] = %.2f, Var[T] = %.2f\n', i-1, media, variancia);
end

% Estatísticas do tempo de cobertura total
fprintf('\nTempo de cobertura total (todos os vértices):\n');
fprintf('E[cover time] = %.2f, Var = %.2f\n', mean(cover_times), var(cover_times));

% Gráfico da série temporal (realização exemplo)
figure;
plot(0:length(serie_temporal_exemplo)-1, serie_temporal_exemplo-1, 'o-','MarkerSize',4);
xlabel('Passos');
ylabel('Vértice visitado (0...m)');
title('Série temporal de uma realização (vértices numerados 0...m)');
grid on;
ylim([-0.5 m+0.5]);
yticks(0:m);
