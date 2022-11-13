function Crust(X)

%{
We apply the Crust algorithm that is written in the 
article A New Voronoi-Based Surface Reconstruction Algorithm available at:
http://compbio.mit.edu/publications/C01_Amenta_Siggraph_98.pdf

Data input:
     - X: cloud of points.

Author: SABIR ILYASS - 2022.
%}

% Get the number of points of X
n1 = size(X,2);

% The Voronoi diagram of X
[V,~] = voronoin(X');

% Get the number of vertices in the Voronoi diagram
n2 = size(V,1);

% Plot the vertices of the Voronoi diagram
plot(V(2:n2,1),V(2:n2,2),'.');

% Concatenate the points of the point cloud X 
% and the vertices of the voronoi diagram V
poles_and_points = zeros(2,n1 + n2 - 1);
poles_and_points(:,1:n1) = X;
poles_and_points(:,n1+1:n1+n2 - 1) = V(2:n2,:)';

% Delaunay triangulation
DT = delaunay(poles_and_points(1,:), poles_and_points(2,:));

% If an edge of the Delaunay triangulation connects two points of the point cloud X,
% we draw the edge between these two points.
for i = 1:size(DT,1)
    x1 = DT(i,1); x2 = DT(i,2); x3 = DT(i,3);
    if (x1 <= n1 && x2 <= n1)
        plot([X(1,x1) X(1,x2)], [X(2,x1) X(2,x2)])
    end
    if (x1<= n1 && x3 <= n1)
        plot([X(1,x1) X(1,x3)], [X(2,x1) X(2,x3)])
    end
    if (x2<= n1 && x3 <= n1)
        plot([X(1,x3) X(1,x2)], [X(2,x3) X(2,x2)])
    end
end