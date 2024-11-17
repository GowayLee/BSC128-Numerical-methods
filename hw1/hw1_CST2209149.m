% hw1
% ID: CST2209149
% Name: Li Haoyuan

clear
clc
close all

display("CST2209149 Li Haoyuan");
fprintf("\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step 1
x = 1.5;
TOL = 1.0e-5;
N_MAX = 50;
exact_value = 0.4054651081;
N = 1;
y = x - 1;
SUM = 0.0;
POWER = y;
TERM = y;
SIGN = -1;

% Step 2
while (N <= N_MAX)
    
    % Step 3
    SIGN *= -1;
    SUM += SIGN * TERM;
    POWER *= y;
    TERM = POWER / (N + 1);

    % Step 4
    if (abs(TERM) < TOL)
        fprintf("The minimal value of N is %d.\n", N);
        fprintf("The approximate value of ln(%g) is %11.10f.\n", x, SUM);
        fprintf("The exact value of ln(%g) is %11.10f.\n", x, exact_value);
        fprintf("The absolute error is %e.\n", abs(exact_value - SUM));
        disp("Method success!");
        return;
    end

    % Step 5
    N++;
end

% Step 6
fprintf("Exceed MAXIMUM_N: %d.\nMethod failed.\n", N_MAX);
return;