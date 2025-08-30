Nsim = 1e6;
U1 = rand(Nsim,1);
U2 = rand(Nsim,1);
X = U1 + U2;

P_a = mean(X >= 0 & X < 0.5);
P_b = mean(X >= 0.5 & X < 1);
P_c = mean(X >= 1 & X < 1.5);
P_d = mean(X >= 1.5 & X <= 2);
P_e = mean(X > 2);

disp([P_a P_b P_c P_d P_e]);
