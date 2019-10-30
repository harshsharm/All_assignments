function out = cov(img1,mtx,n)
if(mod(n,2)~=0)
    m = (n-1)/2;
else
    m=n/2;
end
d = size(img1);
out = zeros(d(1,1)+2*m,d(1,2)+2*m);
img = zeros(d(1,1)+2*m,d(1,2)+2*m);

img(m+1:(end-m),m+1:(end-m)) = img1;
for i = 2:d(1,1)
    for j = 2:d(1,2)
        part_temp = img(i-1:i+n-2,j-1:j+n-2) .* mtx;
        out(i-1,j-1) = sum(part_temp(:));
    end
end