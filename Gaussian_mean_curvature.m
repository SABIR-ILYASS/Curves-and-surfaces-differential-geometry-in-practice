function H = Gaussian_mean_curvature(im,f, method)

%{
this function allows to calculate, display the gaussian curvature 
and the average curvature of a given image at the input.

Input data:
     - im: image.
     - f: real parameter.
     - method: "gaussian" or "mean" 

Author: SABIR ILYASS - 2022.

%}

im = imresize(im, f);
[w,h] = size(im);

H = zeros(w - 4,h - 4);

if (w >= 2 && h >= 2)
    % initializing tangent vectors
    X_u_1 = zeros(w - 2,h - 2);
    X_u_3 = zeros(w - 2,h - 2);

    X_v_2 = zeros(w - 2,h - 2);
    X_v_3 = zeros(w - 2,h - 2);

    % initializing the derivation of tangent vectors

    X_uu_3 = zeros(w - 4,h - 4);

    X_uv_3 = zeros(w - 4,h - 4);

    X_vv_3 = zeros(w - 4,h - 4);

    Normal_1 = zeros(w - 2,h - 2);
    Normal_2 = zeros(w - 2,h - 2);
    Normal_3 = zeros(w - 2,h - 2);

    for i = 1:w-2
        for j = 1:h-2
                norm_u_ij = sqrt((im(i + 2,j) - im(i, j))^2 + 1);
                X_u_1(i,j) = 1 / norm_u_ij;
                X_u_3(i,j) = (im(i + 2,j) - im(i,j)) / norm_u_ij;

                norm_v_ij = sqrt((im(i,j + 2) - im(i, j))^2 + 1);
                X_v_2(i,j) = 1 / norm_v_ij;
                X_v_3(i,j) = (im(i,j + 2) - im(i, j)) / norm_v_ij;

                norm_n = sqrt(X_u_3(i,j)^2 + X_v_3(i,j)^2 + 1);
                Normal_1(i,j) = - X_u_3(i,j)/norm_n;
                Normal_2(i,j) = - X_v_3(i,j)/norm_n;
                Normal_3(i,j) =  1/norm_n;

        end
    end

    for i = 1:w-4
        for j = 1:h-4
            X_uu_3(i,j) = (im(i+4,j) + im(i,j) - 2 * im(i+2,j)) / abs(im(i+4,j) + im(i,j) - 2 *  im(i+2,j));
            X_vv_3(i,j) = (im(i,j+4) + im(i,j) - 2 * im(i,j+2)) / abs(im(i,j+4) + im(i,j) - 2 * im(i,j+2));
            X_uv_3(i,j) = (im(i + 2,j + 2) + im(i,j) - im(i + 2,j) - im(i,j+2)) / abs(im(i + 2,j + 2) + im(i,j) - im(i + 2,j) - im(i,j+2));

            %  First fundamental Coeffecients of the surface (E,F,G)
            E = X_u_1(i,j)^2 + X_u_3(i,j)^2;
            F = X_u_3(i,j) * X_v_3(i,j);
            G = X_v_2(i,j)^2 + X_v_3(i,j)^2;
            
            % Second fundamental Coeffecients of the surface (L,M,N)
            L = Normal_3(i,j) * X_uu_3(i,j);
            M = Normal_3(i,j) * X_uv_3(i,j);
            N = Normal_3(i,j) * X_vv_3(i,j);

            switch method
                case "gaussian"
                    H(i,j) = (L.*N - M.^2)./(E.*G - F.^2);  

                case "mean"
                    H(i,j) = (E.*N + G.*L - 2.*F.*M)./(2*(E.*G - F.^2));
                
                otherwise
                    msg = 'Please enter the name of the corpure among the following proposals: gaussian and mean.';
                    error(msg);
            end
        end
    end
end

image_3D_x = zeros(w - 4,h - 4);
image_3D_y = zeros(w - 4,h - 4);

for i = 1:w-4
    for j = 1:h-4
        image_3D_x(i, j) = i+2;
        image_3D_y(i, j) = j+2;
    end
end
figure;
surf(image_3D_x, image_3D_y, H);
title(sprintf('The %s curvature',method));