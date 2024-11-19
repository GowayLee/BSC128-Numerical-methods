disp("---------------------\nQUESTION 1");
disp("a)");
x = pi / 4;
exact = atan(x);
result_list = [];
for n = 1:10
  result = 0;
  for i = 1:n
    result = result + ((-1)^(i+1)) * (x^(2*i-1)) / (2*i-1);
  end
  result_list = [result_list, result];
end
fprintf("Exact value archtan(pi/4) = %f\n", exact);
disp("Approximate value archtan(pi/4): ");
for i = 1:length(result_list)
  abs_err = abs(exact - result_list(i));
  rel_err = abs_err / abs(exact);
  fprintf("n = %d,\tapprox = %f,\tabs_err = %f,\trel_err = %f\n", i, result_list(i), abs_err, rel_err);
end

disp("\nb)");
x = 1;
exact = atan(x);
for n = 1:5000
  result = 0;
  for i = 1:n
    result = result + ((-1)^(i+1)) * (x^(2*i-1)) / (2*i-1);
  end
  err = abs(4*result - pi);
  if err < 1e-3
    fprintf("n = %d,\tapprox = %f,\terr = %f\n", n, result, err);
    break;
  end
end

disp("\nc)");
x = 1; TOL = 1.0e-10; MAX_ITER = 30000000001;
N = 1; y = x; SUM = 0; POWER = y; TERM = y; SIGN = -1;
% while (TERM*4 > TOL && N < MAX_ITER)
%   if (mod(N, 1000000) == 0)
%     fprintf("N = %d,\tapprox = %.13f\n", N, TERM);
%   end
%   TERM = POWER / (2*N - 1);
%   N++;
% end
% TERM
%N: 20000000001
disp("N = 20000000001");

disp("\n---------------------\nQUESTION 2");

disp("\na)");
N_0 = 1000000;
N_1 = 1564000;
v = 435000 / 1000000;
t = 1;
% Equation: N_1 = N_0 * exp(lambda*t) + (v/lambda) * (exp(lambda * t) - 1)

disp("\nb)");
function p = F(lambda)
  p =  1564000 - 1000000 * exp(lambda * 1) - (0.435 / lambda) * (exp(lambda * 1) - 1);
end

disp("\nc)");
% g(x) = F'(x)
function p = g(lambda)
  p = -1 * 1000000 * 1 * exp(lambda * 1) + (0.435 / lambda^2) * (exp(lambda * 1) - 1) - (0.435 / lambda) * 1 * exp(lambda * 1);
end

p0 = 0.01;
MAX_ITER = 50; TOL = 1e-4; count = 0;
while (count < MAX_ITER)
  p1 = p0 - (F(p0)/g(p0));

  if (abs(p1 - p0) < TOL)
    break;
  end
  p0 = p1;
  count = count + 1;
endwhile
fprintf('Approximation of the birth rate lambda is %f\n', p1);

disp("\nd)");
lambda = p1;
N_2 = N_0 * exp(lambda * 2) + (v/lambda) * (exp(lambda * 2) - 1);
fprintf('N(2) = %d\n', N_2);

disp("\n---------------------\nQUESTION 3");

disp("\na)");
function p = f(x)
  p = exp(0.1*x^2);
end
% g(x) = f'(x)
function p = g(x)
  p = 0.2 * x * exp(0.1*x^2);
end

x = 1.25;
exact = f(x);
X = [1, 1.5, 2, 3]; % Known_X
F = [f(X(1)), f(X(2)), f(X(3)), f(X(4))]; % Known_F
dF = [g(X(1)), g(X(2)), g(X(3)), g(X(4))]; % Known_derivative_data

disp("\nb)");
N = length(X);
n = N - 1;
Q = zeros(N, N);

for i = 1 : N
	Q(i, 1) = F(i);
end

% Step 1
for i = 0 : n
	I = i + 1;
	for j = 1 : i
		J = j + 1;
		Q(I, J) = ((x - X(I-J+1)) *  Q(I, J-1) - (x - X(I)) * Q(I-1, J-1)) / (X(I) - X(I-J+1));
	end
end

fprintf("Approximation: Q(%d,%d) = %.7f\n", N, N, Q(N, N));
abs_err = abs(exact - Q(N, N));
fprintf("Absolute error: %.7f\n", abs_err);

disp("\nc)");
x = 1.25;
X=[1, 1.5];
F = [f(X(1)), f(X(2))]; % Known_F
dF = [g(X(1)), g(X(2))]; % Known_derivative_data

n = length(X);
% Initialize 
Q(1:2*n, 1:2*n) = 0;
z(1:2*n) = 0;

% Step 1
for i = 1:n
  % Step 2
  z(2*(i-1)+1) = X(i);
  z(2*i) = X(i);
  Q(2*(i-1)+1, 1) = F(i);
  Q(2*i, 1) = F(i);
  Q(2*i, 2) = dF(i);
  
  % Step 3
  if(i ~= 1)
    Q(2*i-1, 2) = (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
  end
end

% Step 4
for i = 3 : 2*n
  for j = 3 : i
    Q(i, j) = (Q(i, j-1) - Q(i-1, j-1)) / (z(i) - z(i-j+1));
  end
end

% Compute result
result = 0;
h = 3;
for i = 1 : 2*n
  temp = 1;
  for j = 1 : i-1
    temp = temp * (x-z(j));
  end
  result = result + Q(i,i)*temp;
end
fprintf("Approximation: H_%d(%.2f) = %.7f\n", h, x, result);
abs_err = abs(exact - result);
fprintf("Absolute error: %.7f\n", abs_err);

disp("\nd)");
x = 1.25;
X=[1 2 3];
F = [f(X(1)), f(X(2)), f(X(3))]; % Known_F
dF = [g(X(1)), g(X(2)), g(X(3))]; % Known_derivative_data

n = length(X);
% Initialize 
Q(1:2*n, 1:2*n) = 0;
z(1:2*n) = 0;

% Step 1
for i = 1:n
  % Step 2
  z(2*(i-1)+1) = X(i);
  z(2*i) = X(i);
  Q(2*(i-1)+1, 1) = F(i);
  Q(2*i, 1) = F(i);
  Q(2*i, 2) = dF(i);
  
  % Step 3
  if(i ~= 1)
    Q(2*i-1, 2) = (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
  end
end

% Step 4
for i = 3 : 2*n
  for j = 3 : i
    Q(i, j) = (Q(i, j-1) - Q(i-1, j-1)) / (z(i) - z(i-j+1));
  end
end

% Compute result
result = 0;
h = 5;
for i = 1 : 2*n
  temp = 1;
  for j = 1 : i-1
    temp = temp * (x-z(j));
  end
  result = result + Q(i,i)*temp;
end
fprintf("Approximation: H_%d(%.2f) = %.7f\n", h, x, result);
abs_err = abs(exact - result);
fprintf("Absolute error: %.7f\n", abs_err);