% Simulação de palavras de 3 letras
n = 6; % número de letras
Nsim = 1e6; % número de simulações
countA = 0; countB = 0; countC = 0;
countAB = 0; countAC = 0; countBC = 0;

for i = 1:Nsim
    palavra = randi(n,1,3); % palavra de 3 letras
    % Eventos
    if palavra(1) == 1  % letra s é representada por 1
        countA = countA + 1;
    end
    if palavra(2) == 1
        countB = countB + 1;
    end
    if sum(palavra(1)==palavra) == 2 || sum(palavra(2)==palavra) == 2 || sum(palavra(3)==palavra) == 2
        countC = countC + 1;
    end
    % Interseções
    if palavra(1) == 1 && sum(palavra(1)==palavra) == 2
        countAC = countAC + 1;
    end
    if palavra(2) == 1 && sum(palavra(2)==palavra) == 2
        countBC = countBC + 1;
    end
    if palavra(1) == 1 && palavra(2) == 1
        countAB = countAB + 1;
    end
end

P_A = countA/Nsim
P_B = countB/Nsim
P_C = countC/Nsim
P_AB = countAB/Nsim
P_AC = countAC/Nsim
P_BC = countBC/Nsim

