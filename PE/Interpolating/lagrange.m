% Known_x_data and known_y_data
x_data = [2, 2.75, 4];

%% Or just enter known_y_data
%y_data = [1/2, 1/2.75, 1/4];

% Definition for f(X)
function y = f(x)
  y = 1 / x;
end

% Generate known_y_data
y_data = [];
for i = 1:length(x_data)
  y_data(i) = f(x_data(i));
end

% Interpolate x
x_interpolate = 3;

n = length(x_data);

% Initialize interpolated y
y_interpolated = 0;

for i = 1:n
  term = 1;
  for j = 1:n
    if j ~= i
      term = term * (x_interpolate - x_data(j)) / (x_data(i) - x_data(j));
    end
  end
  y_interpolated = y_interpolated + y_data(i) * term;
end

% Display results
disp(['Interpolate x: ', num2str(x_interpolate)]);
disp(['Interpolating result y: ', num2str(y_interpolated)]);