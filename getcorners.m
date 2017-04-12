function [r,c] = getcorners(I, method, sigma, thresh, alpha)

% returns the coordinates (row and column) of corners in a given grayscale image.
%
% USAGE: [r,c] = getCorners(I, METHOD, sigma, thresh, alpha)
% I: a grayscale image
% METHOD: can be one of 'h' or 's'
% 'h' for Harris cornerness measure
% 's' for Szelski cornerness measure
% SIGAM: used to compute the size of Gaussian filter (size=6*SIGMA) and it is
% also used to compute the size of dilation filter used in nonmaximal suppression
% of the output, default: 1.
% THRESH: for cornerness strength (default: 0.50, i.e. 50% of max R)
% ALPHA: used only for "Harris" method (default: 0.04)


I = im2double(I);

if(nargin < 5)
   sigma=1; alpha=0.04; thresh = 0.1; method = 'h'; 
end


% Compute Ix and Iy
dx = [-1 -1 -1; 0 0 0; 1 1 1]; dy = dx'; % derivative masks
Ix = imfilter(I,dx,'same'); %same: output array is same size as input array
Iy = imfilter(I,dy,'same');
% Compute Sxx, Syy, and Sxy
w = fspecial('gaussian', round(6*sigma), sigma); %Gaussian filter
Sxx = conv2(Ix.^2, w, 'same');
Syy = conv2(Iy.^2, w, 'same');
Sxy = conv2(Ix.*Iy, w, 'same');

detA = Sxx.*Syy - Sxy.*Sxy;
traceA = Sxx + Syy; 

% Compute R
if(method == 'h')
    %Harris Method
    R = detA - alpha * traceA.^2; % Harris measure
else
    %Szelski Method
    R = detA ./ traceA;
end

% Threshold R
corners = R > thresh;


[r,c] = find(corners == 1);