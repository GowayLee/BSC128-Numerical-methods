% known_x_data, known_y_data, known_dy_data, x_interpolate
x_data = [0, 8, 13];
y_data = [0, 623, 993];
dy_data = [75, 74, 72];

x_interpolate = 6.5;

n = length(x_data);

% Initialize 
Q(1:2*n, 1:2*n) = 0;
z(1:2*n) = 0;

% Step 1
for i = 1:n
  % Step 2
  z(2*(i-1)+1) = x_data(i);
  z(2*i) = x_data(i);
  Q(2*(i-1)+1, 1) = y_data(i);
  Q(2*i, 1) = y_data(i);
  Q(2*i, 2) = dy_data(i);
  
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

% Display Q
Q

% Compute result
result = 0;
for i = 1 : 2*n
  temp = 1;
  for j = 1 : i-1
    temp = temp * (x_interpolate-z(j));
  end
  result = result + Q(i,i)*temp;
end

% Display the position
result