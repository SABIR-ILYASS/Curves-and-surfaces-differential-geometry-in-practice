function tracer_frenet (X)

%{
This function allows to draw the tangent vectors and the normal vectors 
and the centers of curvature of the curve defined by a point cloud.

Data input:
     - X: cloud of points

Author: SABIR ILYASS - 2022.
%}

% Get the number of points of X
n = size(X,2);

% Initializing tangent vectors
tangent_X = zeros(2,n - 2);

% Initializing the derivation of the tangent vectors and the normal vectors
derived_tengant_vector = zeros(2, n - 2);
normal_X = zeros(2,n - 2);

% Initializing the center of curvature
center_of_curvature = zeros(2, n-2);

% Tangent vectors
for i = 1:n-2
    tangent_X(:,i) = (X(:,i + 2) - X(:, i)) / norm(X(:,i) - X(:, i + 2));
end

% Derivation of the tangent vectors and the normal vectors
for i = 1:n-2
    derived_tengant_vector(:,i) = 2 * ((X(:,i+2) - X(:,i+1))/norm(X(:,i+2) - X(:,i+1)) - (X(:,i+1) - X(:,i))/norm(X(:,i+1) - X(:,i))) / norm(X(:,i+2) - X(:,i));
    % center of curvature
    curvature = norm(derived_tengant_vector(:,i));
    normal_X(:,i) = derived_tengant_vector(:,i) /  curvature;
    center_of_curvature(:,i) = X(:,i + 1) + normal_X(:,i) ./ curvature;

end

% % Normal vectors
% normal_X(1,:) = -tangent_X(2,:);
% normal_X(2,:) = tangent_X(1,:);

axis equal;
hold on;

quiver(X(1,2:n-1), X(2,2:n-1), tangent_X(1,:), tangent_X(2,:), 'off');
quiver(X(1,2:n-1), X(2,2:n-1), normal_X(1,:), normal_X(2,:), 'off');
title('tangent and normal vectors');

for i = 1 : n -2
        cercles(center_of_curvature(1,i), center_of_curvature(2,i), X(1,i+1), X(2,i+1));
end


