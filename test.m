clc; clear; close all;

im = double(imread('saltlake.png'));
%image_22_3D(im, 0.4);
Gaussian_mean_curvature(im,0.4,"mean");