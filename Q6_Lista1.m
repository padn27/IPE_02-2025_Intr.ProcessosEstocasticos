Nsim = 1e6; % número de simulações
vitorias = zeros(3,1); % contagem de vitórias: A,B,C

for i = 1:Nsim
    % Inicializa torneio
    partidas = 0;
    last_winner = 0;
    consecutivas = 0;
    
    % Primeira partida: A x B
    players = [1 2];
    while partidas < 4 && consecutivas < 2
        winner = players(randi(2)); % sorteio do vencedor
        partidas = partidas + 1;
        
        % Verifica vitórias consecutivas
        if winner == last_winner
            consecutivas = consecutivas + 1;
        else
            consecutivas = 1;
        end
        last_winner = winner;
        
        % Define próximo jogo
        switch winner
            case 1 % A venceu
                if any(players==3)
                    players = [1 3]; 
                else
                    players = [1 2];
                end
            case 2 % B venceu
                if any(players==3)
                    players = [2 3];
                else
                    players = [1 2];
                end
            case 3 % C venceu
                players = [3 winner]; % joga contra o perdedor da última?
        end
    end
    
    % Conta vitória final
    vitorias(last_winner) = vitorias(last_winner) + 1;
end

% Probabilidades
probabilidades = vitorias / Nsim;
disp('Probabilidades de vitória de cada jogador (A,B,C):')
disp(probabilidades)
