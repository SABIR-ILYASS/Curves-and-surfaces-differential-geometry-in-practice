function image_2_3D(im, f)

%{
The following function transforms a given input image into a parameterized
surface whose height is equal to the image pixel value.

The two tangent vectors and the normal vector are calculated and displayed.

Input data:
     - im: image.
     - f: real parameter.

Author: SABIR ILYASS - 2022.
%}

% Resize the image
im = imresize(im, f);
% Get the height and width
[h,w] = size(im);

image_3D_x = zeros(h,w);
image_3D_y = zeros(h,w);

for i = 1:h
    for j = 1:w
        image_3D_x(i, j) = i;
        image_3D_y(i, j) = j;

    end
end

figure;
surf(image_3D_x, image_3D_y, im);


if (h >= 2 && w >= 2)
    % Initializing tangent and normal vectors
    X_u_1 = zeros(h - 2,w - 2);
    X_u_3 = zeros(h - 2,w - 2);

    X_v_2 = zeros(h - 2,w - 2);
    X_v_3 = zeros(h - 2,w - 2);

    Normal_1 = zeros(h - 2,w - 2);
    Normal_2 = zeros(h - 2,w - 2);
    Normal_3 = zeros(h - 2,w - 2);

    for i = 1:h-2
        for j = 1:w-2
                norm_u_ij = sqrt((im(i + 2,j) - im(i, j))^2 / 4 + 1);
                X_u_1(i,j) = 1 / norm_u_ij;
                X_u_3(i,j) = (im(i + 2,j) - im(i,j)) / (2 * norm_u_ij);

                norm_v_ij = sqrt((im(i,j + 2) - im(i, j))^2 / 4 + 1);
                X_v_2(i,j) = 1 / norm_v_ij;
                X_v_3(i,j) = (im(i,j + 2) - im(i, j)) / (2 * norm_v_ij);

                norm_n = sqrt(X_u_3(i,j)^2 + X_v_3(i,j)^2 + 1);
                Normal_1(i,j) = - X_u_3(i,j)/norm_n;
                Normal_2(i,j) = - X_v_3(i,j)/norm_n;
                Normal_3(i,j) =  1/norm_n;
        end
    end

    hold on;
    quiver3(image_3D_x(2:h-1,2:w-1),image_3D_y(2:h-1,2:w-1),im(2:h-1,2:w-1),X_u_1,zeros(h - 2,w - 2),X_u_3,'off');
    quiver3(image_3D_x(2:h-1,2:w-1),image_3D_y(2:h-1,2:w-1),im(2:h-1,2:w-1),zeros(h - 2,w - 2),X_v_2,X_v_3,'off');
    quiver3(image_3D_x(2:h-1,2:w-1),image_3D_y(2:h-1,2:w-1),im(2:h-1,2:w-1),Normal_1,Normal_2,Normal_3,'off');

end

