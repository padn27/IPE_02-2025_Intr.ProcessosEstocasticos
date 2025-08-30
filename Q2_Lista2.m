% Parametros
a = 1; b = 1; % você pode mudar
Nsim = 1e6;

countA=0; countB=0; countC=0; countD=0; countBC=0;

for i=1:Nsim
    x = rand()*a;
    y = rand()*b;
    
    if x < y
        countA = countA + 1;
    end
    if b*x + a*y <= a*b/2
        countB = countB + 1;
    end
    if b*x + a*y >= a*b/3
        countC = countC + 1;
    end
    if x + y < 1/3
        countD = countD + 1;
    end
    if (b*x + a*y <= a*b/2) && (b*x + a*y >= a*b/3)
        countBC = countBC + 1;
    end
end

P_A = countA/Nsim
P_B = countB/Nsim
P_C = countC/Nsim
P_D = countD/Nsim
P_BC = countBC/Nsim
P_B*P_C
