function output = testHarris(I2)

I = im2bw(rgb2gray(I2),.45);

se = strel('square',10);

I = imclose(I,se);
I = imopen(I,se);

se = strel('square',40);
I = imopen(I,se);

se = strel('square',45);
I = imclose(I,se);



%%Test Harris
[r,c] = getcorners(I,'h',10,.1,.001);

M2 = extremeCorners([r,c]);

I3 = align(I, M2);
I4 = align(I2,M2);

[r,c] = getcorners(I3,'h',10,.1,.001);
M2 = extremeCorners([r,c]);

big = max(M2);
small = min(M2);

output = imcrop(I4, [small(1,2)+20 small(1,1)+20 big(1,2)-small(1,2)-40 big(1,1)-small(1,1)-40]);
