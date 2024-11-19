p0 = -0.88757622;

M = 50;

function p = f(x)
  p = x^2 - 2*e^x;
end

% g(x) = f'(x)
function p = g(x)
  p = 2*x - 2*e^x;
end

TOL = 1e-6;
count = 0;
while (count < M)
  p1 = p0 - (f(p0)/g(p0));
  fprintf("%10.8f\n", p1);

  if (abs(p1 - p0) < TOL)
    break;
  end
  p0 = p1;
  count = count + 1;
endwhile

fprintf('The root is %f\n', p1);