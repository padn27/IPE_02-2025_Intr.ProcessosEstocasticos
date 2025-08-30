mu = 7; sigma = 1;
prob = normcdf(6, mu, sigma) - normcdf(5, mu, sigma);
disp(['Probabilidade: ', num2str(prob)]);
