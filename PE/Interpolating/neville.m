% Input
x = 0.0; % x value to approximate
X = [-0.5 -0.25 0.25 0.5]; % Known_x_data
F = [1.93750 1.33203 0.800781 0.687500]; % Known_y_data
N = length(X);
n = N - 1;
Q = zeros(N, N);
disp("Question Input:\n\tx: ");
disp(X);
disp("\tf(x)");
disp(F);
fprintf("Do the approximation for f(%.1f).\n\n", x);

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
	disp("=====================================");
	fprintf("Q for %dth iteration:\n", i+1);
	disp(Q);
end

% Output Q
disp("=====================================\n");
disp("The final Q is:");

for i = 1 : N
	for j = 1 : N
		fprintf("\t%.7f", Q(i, j));
	end
	fprintf("\n");
end

fprintf("\nWe select Q(%d,%d) as the Approximation.\n\tf(%.1f): Q(%d,%d) = %.7f\n", N, N, x, N, N, Q(N, N));