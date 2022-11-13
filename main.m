% SABIR ILYASS
% Curves and surfaces : differential geometry in practice

clc; clear; close all;

%% 1 Differential geometry of curves and surfaces
% 1.1 Planar curves
% 1.1.1 Study of an ellipse

% question 1,2,3  and 4:
% X = ellipse(25,25,20);
% afficher_courbe(X);
% tracer_frenet(X);

% 1.1.2 Study of a manually entered curve
% Question 5:
X2 = saisir_courbe;
n = size(X2,2);
Y = zeros(2, n + 2);
Y(:,1:n) = X2;
Y(:,n+1) = X2(:,1); X2(:,n+2) = X2(:,2);
tracer_frenet(Y);


% 1.2 An example of a surface : the digital terrain model
% Question 6:
% im = double(imread("saltlake.png"));
% imshow(im,[]);
% image_2_3D(im, 0.5);

% question 7:


% % 2 Modeling of curves and surfaces0
% % 2.1 Curve/surface reconstruction from a point cloud
% % Question 8:
% X3 = saisir_courbe();
% Crust(X3);

% % 2.2 Modeling of smooth curves
% % Question 9:
% % Enter a set of points manually with the mouse
% X = saisir_courbe();
% 
% % Get the number of points
% n = size(X,2);
% 
% % initialization of the Bezier curve
% % we take 100 * n points to draw more 
% % points of the beziers curve and to show more its curvature
% Bezier_points = zeros(2,n * 100);
% 
% for i = 1: 100 * n
%     [Cu_1, Cu_2] = bezier(X, (i - 1) / (100 * n));
%     Bezier_points(1,i) = Cu_1;
%     Bezier_points(2,i) = Cu_2;
% end
% 
% % plot segments between the points of the point cloud X
% for i = 1:(n - 1)
%     plot([X(1,i) X(1, i + 1)],[X(2,i) X(2, i + 1)]);
% end
% 
% % plot the Bezier curve
% for i = 1:(100 * n - 1)    
%     plot([Bezier_points(1,i) Bezier_points(1, i + 1)],[Bezier_points(2,i) Bezier_points(2, i + 1)]);
% end
