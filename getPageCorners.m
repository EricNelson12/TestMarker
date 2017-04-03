function M = getPageCorners(I)

I = im2bw(rgb2gray(I),.45);
% imshow(I);


se = strel('square',10);

I = imclose(I,se);
I = imopen(I,se);

se = strel('square',40);
I = imopen(I,se);

se = strel('square',45);
I = imclose(I,se);
% imshow(I);

%%Test Harris
[r,c] = getcorners(I,'h',10,.1,.001);

X = [r,c];

I = im2double(I);


middleRow = mean(X(:,1));
middleCol = mean(X(1,:));

TR  = find(X,r>20)

% plot(r(k),c(k),'r-',r,c,'b*');





matrixOfCoordinates(1,:) = val1;
matrixOfCoordinates(2,:) = val2;
matrixOfCoordinates(3,:) = val3;
matrixOfCoordinates(4,:) = val4;

M = matrixOfCoordinates;

% I = insertMarker(I,val1);

% imshow(I);


