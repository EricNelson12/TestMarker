function output = extremeCorners(M)
C(:,4) = sum(M,2);

for h = 1 : size(M, 1)
    C(h,3) = M(h,1) - M(h,2);
    C(h,2) = M(h,2) - M(h,1);
    C(h,1) = 0 - M(h,2) - M(h,1);
end

[A, I] = max(C);

output(1,:) = M(I(1,1),:);
output(2,:) = M(I(1,2),:);
output(3,:) = M(I(1,3),:);
output(4,:) = M(I(1,4),:);