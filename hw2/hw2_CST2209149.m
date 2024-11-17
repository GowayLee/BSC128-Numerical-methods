% hw2
% ID: CST2209149
% Name: Li Haoyuan

clear;
clc;
close all;

num = mod(2209149, 6) + 1;

fprintf("CST2209149 Li Haoyuan\nMy Question num is %d\n\n", num);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f(x) = cos(x) - x
function retVal = f(x)
	retVal = cos(x) - x;
end

% df(x)
function retVal = df(x)
  retVal = -sin(x) - 1;
end
a = 0
b = pi / 2

p0 = (a + b) / 2
TOL = 1.0E-5
M = 30

disp("\n>>>>> Method start <<<<<");
% Step 1
i = 1;

% Step 2
while(i <= M)
    % Step 3
    p = p0 - f(p0) / df(p0);
    fprintf("i= %d, p = %10.8f\n", i, p);
    % Step 4
    if(abs(p-p0) < TOL)
        fprintf("\nMethod success!\nIteration: %d\np = %10.8f\n", i, p);
        return;
    end
    % Step 5
    i = i + 1;
    % Step 6
    p0 = p;
end

% Step 7 for fail
disp("Method Failed!");
fprintf("Iteration: %d\nApproximation is %10.8f\n",i , p);
