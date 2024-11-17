a = -1;
b = 2;
tol = 0.0001;
n = 0;

function result = f(x)
  result = 2 - (x ^ 2) * sin(x);
end

while (abs(b - a) > tol)
  p = (a + b) / 2;
  value = f(p);
  fprintf('%dth: a%d = %f, b%d = %f, p%d = %f. f(p%d) = %f\n', n, n+1, a, n+1, b, n+1, p, n+1, value);
  if (value == 0)
    break;
  elseif (f(a) * value < 0)
    b = p;
  else
    a = p;
  end
  n = n + 1;
end
fprintf('The root is %f\n', p);
fprintf('The number of iterations is %d\n', n);