Nsim = 1e6; % número de simulações

% gerar coeficientes uniformes
a = 1 + (2-1)*rand(Nsim,1); % U(1,2)
b = 5 + (6-5)*rand(Nsim,1); % U(5,6)
c = 2 + (5-2)*rand(Nsim,1); % U(2,5)

% calcular discriminante
Delta = b.^2 - 4*a.*c;

% contar quantas vezes Delta < 0
prob_imaginaria = sum(Delta<0)/Nsim

% histograma do discriminante
histogram(Delta,50)
xlabel('\Delta = b^2 - 4ac')
ylabel('Frequência')
title('Histograma do discriminante')
