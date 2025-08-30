Nsim = 1e6;   % número de simulações
p_casa = 0.4; % probabilidade de estar em casa
count = 0;

for i = 1:Nsim
    pessoas = rand(1,4) < p_casa; % gera 4 números aleatórios
    if sum(pessoas) == 2
        count = count + 1;
    end
end

prob_sim = count / Nsim;
disp(['Probabilidade por simulação: ', num2str(prob_sim)]);
