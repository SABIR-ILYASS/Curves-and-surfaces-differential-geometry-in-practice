function [C_u_1, C_u_2] = bezier(P, u)

%{
The following function allows to compute the Bézier's curve
of a point cloud given at the input applied to a point u.

Input data:
     - P: cloud of points.
     - u: real number in [0,1].

Output data:
     - C_u_1: the first Bézier's curve coordinate at the point u.
     - C_u_2: the second Bézier's curve coordinate at the point u.

Author: SABIR ILYASS - 2022.
%}

% The following function returns for an integer n 
% the i-th Berstein polynomial applied to the point u
bernstein = @(n, i, u) factorial(n) * (u^i) * ((1-u)^(n-i)) / (factorial(i) * factorial(n - i));

n = size(P,2);
C_u_1 = 0; C_u_2 = 0;

for i = 0:n - 1
    C_u_1 = C_u_1 + bernstein(n - 1,i,u) * P(1,i + 1);
    C_u_2 = C_u_2 + bernstein(n - 1,i,u) * P(2,i + 1);
end