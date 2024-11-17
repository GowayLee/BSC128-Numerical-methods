% hw2
% ID: CST2209149
% Name: Li Haoyuan

clear;
clc;
close all;

ID = 2209149;
disp("CST2209149 Li Haoyuan");

numOfQuestion = mod(ID, 6) + 1;
fprintf("The number of my question is %d\n", numOfQuestion);

% Method 1 to define function
% Inline expression "@"
% f = @(x) cos(x) - x;
% f = @(x) x ^ 2 - x - 1;

% Method 2 to define function 
function retVal = g(x)
	retVal = sqrt(x+1);
end


% the interval enbeds the roots
a = 0;
b = pi / 2;

p0 = 0
M = 50
TOL = 1.0e-5
% fixed point iteration
i = 1;
while(i <= M)
	p = g(p0);
	fprintf("p = %.7f\n", p);
	if (abs(p - p0) < TOL)
		% disp(p);
		fprintf("%.7f\n", p);
		return
	end
	p0 = p; % update the p0
end

disp("Method failed");
