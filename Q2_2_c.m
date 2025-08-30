% Q2_2_c.m
Nsim = 1e6; 
dados = randi(6,Nsim,2); 
count = sum(dados(:,1) == 1 & dados(:,2) == 1);
prob_sim = count / Nsim;
fprintf('Probabilidade estimada por simulação: %.5f\n', prob_sim);
