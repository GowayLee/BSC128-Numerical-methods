% (c) Hermite method
% initializtion
myQ2(1:2*N,1:2*N) = 0;
z(1:2*N) = 0;
% Step 1
for i = 1 : N
% Step 2
z(2*(i-1)+1) = T(i);
z(2*i) = T(i);
myQ2(2*(i-1)+1,1) = Dist(i);
myQ2(2*i,1) = Dist(i);
myQ2(2*i,2) = convertSpeed(i);
% Step 3
if(i~=1)
myQ2(2*i-1,2) = (myQ2(2*i-1,1)-myQ2(2*i-2,1))/(z(2*i-1)-z(2*i-2));
end
end
for i = 3 : 2*N
for j = 3 : i
myQ2(i,j) = (myQ2(i,j-1)-myQ2(i-1,j-1))/(z(i)-z(i-j+1));
end
end
myQ2