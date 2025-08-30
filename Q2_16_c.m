N = 1000;
U1 = rand(N,1);
U2 = rand(N,1);

X1 = U1;
X2 = U1 + U2;

figure;
scatter(X1,X2,'.');
xlabel('X1'); ylabel('X2');
title('Scatter diagram de X1 vs X2');
