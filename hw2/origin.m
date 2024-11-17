% Class + ID + Name
clear, clc, close all

ID = 2209840;
str1 = ['My Id is ' num2str(ID)];
disp(str1)

num = mod(ID,6) + 1;
str2 = ['My num is ' num2str(num)];
disp(str2)

switch num
  case 1
    % definition for f(x)
    function retVal = f( x )
      retVal = exp(x) + 2^(-x) + 2*cos(x) - 6;
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = exp(x) - 2^(-x)*log(2) - 2*sin(x);
    end
    a = 1
    b = 2
  
  case 2
    % definition for f(x)
    function retVal = f( x )
      retVal = log(x-1) + cos(x-1);
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = 1/(x-1) - sin(x-1);
    end
    a = 1.3
    b = 2
  
  case 3
    % definition for f(x)
    function retVal = f( x )
      retVal = x^3 - 2*x^2 - 5;
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = 3*x^2 - 4*x;
    end
    a = 1
    b = 4
  
  case 4
    % definition for f(x)
    function retVal = f( x )
      retVal = cos(x)-x;
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = -sin(x)-1;
    end
    a = 0
    b = pi/2
  
  case 5
    % definition for f(x)
    function retVal = f( x )
      retVal = x^3 + 3*x^2 - 1;
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = 3*x^2 + 6*x;
    end
    a = -3
    b = -2
  
  case 6
    % definition for f(x)
    function retVal = f( x )
      retVal = x - 0.8 - 0.2*sin(x);
    end
    % definition for df(x)
    function retVal = df( x )
      retVal = 1 - 0.2*cos(x);
    end
    a = 0
    b = pi/2
  
end


% input
p0 = (a+b)/2
TOL = 1.0E-5
N0 = 30

OK = 0;

% Step 1
i = 1;

% Step 2
while( i <= N0 && OK==0 )
    % Step 3
    p = p0 - f(p0)/df(p0);
    fprintf("i= %d, p = %f \n",i,p);
    % Step 4
    if( abs(p-p0) < TOL)
        fprintf("p = %f\n",p)
        OK = 1; % jump out of the while loop
        % STOP
    end
    % Step 5
    i = i + 1;
    % Step 6
    p0 = p; % updating p0
end
    
% Step 7
if( OK == 0 )
    disp("Method Failed")
else
    fprintf("After running %d times, the approximation is %10.8f \n",i,p)
end



