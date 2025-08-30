% Comparação Stirling vs fatorial (logs)
Nmax = 100;

% Vetores
N = (1:Nmax)';

% log exato de N! usando gammaln (mais preciso que sum(log))
log_fact_exact = gammaln(N+1);   % ln(N!)

% log de Stirling (forma padrão): 0.5*ln(2*pi*N) + (N+0.5)*ln N - N
log_stirling = 0.5*log(2*pi*N) + (N + 0.5).*log(N) - N;

% diferença nos logs
delta_log = log_fact_exact - log_stirling;   % ln(N!) - L_stirling

% razão approx: Stirling / N! = exp(-delta_log)
ratio = exp(-delta_log);

% erro relativo exato entre aproximação e exato:
% rel_err = |Stirling - exact| / exact = |exp(L) - exp(log_fact_exact)| / exp(log_fact_exact)
% = |exp(L - log_fact_exact) - 1| = |exp(-delta_log) - 1|
rel_error = abs(ratio - 1);

% Mostra alguns valores selecionados em tabela
sel = [1,2,5,10,20,50,100];
fprintf(' N   ln(N!)_exact   ln_Stirling    Delta_log      RelError\n');
for k=sel
    fprintf('%3d  %12.6f   %12.6f   %12.6e   %12.6e\n', ...
        N(k), log_fact_exact(k), log_stirling(k), delta_log(k), rel_error(k));
end

% Plots
figure;
subplot(2,1,1);
plot(N, delta_log, '.-'); grid on;
xlabel('N'); ylabel('\Delta = ln(N!) - L_{Stirling}');
title('Diferença entre ln(N!) e log Stirling');

subplot(2,1,2);
semilogy(N, rel_error, '.-'); grid on;
xlabel('N'); ylabel('Erro relativo |Stirling/N! - 1| (escala log)');
title('Erro relativo da aproximação de Stirling');

% Caso N = 200 (usar logs para evitar overflow)
N200 = 200;
log_exact_200 = gammaln(N200+1);
log_stirling_200 = 0.5*log(2*pi*N200) + (N200 + 0.5)*log(N200) - N200;
delta200 = log_exact_200 - log_stirling_200;
ratio200 = exp(-delta200);
rel_error200 = abs(ratio200 - 1);

fprintf('\nN=200:\n ln(N!) exact = %.10f\n ln(Stirling)  = %.10f\n Delta = %.10e\n RelErr = %.10e\n', ...
    log_exact_200, log_stirling_200, delta200, rel_error200);
