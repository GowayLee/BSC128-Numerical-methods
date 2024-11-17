p0 = -1;
p1 = 1;

M = 50;

function p = f(x)
  p = x^2 - 2*(e^x);
end

TOL = 1e-6;
count = 0;
while (count < M)
  p2 = p1 - (f(p1)*(p1 - p0))/(f(p1) - f(p0));
  fprintf("%10.8f\n", p2);
  p0 = p1;
  p1 = p2;
  if (abs(f(p2)) < TOL)
    break;
  end
  count = count + 1;
endwhile

fprintf('The root is %f\n', p2);