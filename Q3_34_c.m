balls = ['R','R','R','R','B','B'];
comb = nchoosek(balls,2); % todas as combinações de 2 bolas
count = sum( (comb(:,1)=='R' & comb(:,2)=='B') | (comb(:,1)=='B' & comb(:,2)=='R') );
prob = count / size(comb,1);
disp(prob)
