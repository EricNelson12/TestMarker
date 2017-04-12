function [I4,I5,I6] = master(I1, I2, I3)

I1 = imresize(I1, 0.5);
I2 = imresize(I2, 0.5);
I3 = imresize(I3, 0.5);

I4 = testHarris(I1);
I5 = testHarris(I2);
I6 = testHarris(I3);

if(size(I4,2) > size(I5,2))
    I4 = imresize(I4,size(I5,2)/size(I4,2));
else
    I5 = imresize(I5,size(I4,2)/size(I5,2));
end

I6 = imresize(I6,size(I5,2)/size(I6,2));

A = [size(I4, 1) size(I5, 1) size(I6, 1)];

A = max(A);

I4 = imresize(I4, [A size(I4,2)]);
I5 = imresize(I5, [A size(I4,2)]);
I6 = imresize(I6, [A size(I4,2)]);

figure, imshow(I4); title('im1');
figure, imshow(I5); title('im2');
figure, imshow(I6); title('im3');