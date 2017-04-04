function I3 = align(I,M)

mPoints = [];
for i=1:4
 x = M(i,1);
 y = M(i,2);
 mPoints = [mPoints; x y];
 rectangle('Position',[x y 4 4],'EdgeColor','r');
end

x1 = min(mPoints(:,1));
x2 = max(mPoints(:,1));
y1 = min(mPoints(:,2));
y2 = max(mPoints(:,2));
fPoints = [x1 y1; x2 y1; x1 y2;x2 y2];

T = fitgeotrans(mPoints, fPoints, 'projective');
I2 = imwarp(I,T);

I3 = imcrop(I2,[x1 y1 (x2-x1) (y2-y1)]);
