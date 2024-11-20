% xxxx
% ID: CST2209149
% Name: Li Haoyuan

clear;
clc;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("---------------------\nQUESTION 1");
disp("\na)");

T = [0, 8, 13];
Dist = [0, 623, 993];
Speed = [75, 74, 72];

function p = f(x)
  p = 5280 * x / 60 / 60;
end
convertSpeed = [f(Speed(1)), f(Speed(2)), f(Speed(3))];

T
Dist
Speed
convertSpeed

N = length(Dist);
n = N - 1;

disp("\nb)");
% Neville's Method
t = 6.5; % x value to approximate
myQ1 = zeros(N, N);

for i = 1 : N
	myQ1(i, 1) = Dist(i);
end

% Step 1
for i = 2 : N
	for j = 2 : i
		myQ1(i, j) = ((t - T(i-j+1)) *  myQ1(i, j-1) - (t - T(i)) * myQ1(i-1, j-1)) / (T(i) - T(i-j+1));
	end
end

% Output Q
myQ1

fprintf("\nThe approximation of the position of the ball when t=6.5s is myQ1(%d,%d) = %.7f feet\n", N, N, myQ1(N, N));

disp("\nc)");
% Hermite Interpolation
t = 6.5;

% Initialize 
myQ2(2*N, 2*N) = 0;
z(2*N) = 0;

% Step 1
for i = 1:N
  % Step 2
  z(2*(i-1)+1) = T(i);
  z(2*i) = T(i);
  myQ2(2*(i-1)+1, 1) = Dist(i);
  myQ2(2*i, 1) = Dist(i);
  myQ2(2*i, 2) = convertSpeed(i);
  
  % Step 3
  if(i ~= 1)
    myQ2(2*i-1, 2) = (myQ2(2*i-1, 1) - myQ2(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
  end
end

% Step 4
for i = 3 : 2*N
  for j = 3 : i
    myQ2(i, j) = (myQ2(i, j-1) - myQ2(i-1, j-1)) / (z(i) - z(i-j+1));
  end
end

% Display myQ2
myQ2

% Compute result
result = 0;
for i = 1 : 2*N
  temp = 1;
  for j = 1 : i-1
    temp = temp * (t-z(j));
  end
  result = result + myQ2(i,i)*temp;
end

% Display the position
fprintf("\nThe approximation of the position of the ball when t=6.5s is %.7f feet\n", result);

disp("\nd)");
n = 2;
X = [0, 8, 13];
z = [0, 0, 8, 8, 13, 13];
x = t;

disp("\ne)");
mySpeed = myQ2(2,2); % Initialize mySpeed to acutal Q(0, 0)
for i = 3 : 2*N 
  tempSum = 0; 
  for j = 1 : i-1 
    temp = 1; 
    for k = 1 : i-1 
      if k == j 
        temp = temp * 1; 
      else 
        temp = temp * (x-z(k)); 
      end 
    end 
    tempSum = tempSum + temp; 
  end 
  mySpeed = mySpeed + myQ2(i,i)*tempSum; 
end

mySpeed
ansE = mySpeed / 5280 * 60 * 60

disp("\nf)");
% Try different t values in e)'s algorithm.