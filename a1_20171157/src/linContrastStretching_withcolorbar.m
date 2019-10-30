function linContrastStretching_withcolorbar(im,a,b,k)
mini = 256;
maxi = -1;
if size(im,3) == 3
    ne = rgb2gray(im);
else
    ne=im;
end
d = size(ne);
ba = zeros(100,20);
subplot(2,2,1);
imshow(ne);
title('Image Before Contrasting');
%colorbar;
cnt = zeros(1,65);
for i=1:d(1,1)
    for j=1:d(1,2)
        cnt((ne(i,j))/4 +1) = cnt((ne(i,j))/4+1)+1;
    end
end
ne = double(ne);
X1 = zeros(1,k);
for i=1:k
    [val,X1(i)] = max(cnt);
    cnt(X1(i))=0;
    X1(i) = 4*X1(i) -2;
end
%[idx1,X1] = kmeans(ne(:),k);
X1 = uint64(X1);
m = 100/k;
for i=1:k
    for j=1:100
        for cl=1:20
            if j>=(i-1)*m && j<=i*m
                ba(j,cl) = X1(i);
            end
        end
    end
end
%subplot(2,2,3);
ba  = uint8(ba);
subplot(2,2,2);
imshow(ba);
%imagesc(X1);
%colorbar;
d = size(ne);
for i=1:d(1,1)
    for j=1:d(1,2)
        if mini >ne(i,j)
            mini = ne(i,j);
        end
        if maxi < ne(i,j)
            maxi = ne(i,j);
        end
    end
end
dif = double(maxi-mini);
a = double(a);
b = double(b);
maxi = double(maxi);
mini = double(mini);
mini2=0;
for i=1:d(1,1)
    for j=1:d(1,2)
        ne(i,j) = a+((ne(i,j)-mini) * ((b-a)/(dif)));
        if mini2 < ne(i,j)
            mini2 = ne(i,j);
        end
    end
end
ne;
%figure;
%[idx2,X2] = kmeans(ne,5);
%X2 = uint64(X2);
ne = uint8(ne);
cnt2 = zeros(1,65);
for i=1:d(1,1)
    for j=1:d(1,2)
        cnt2((ne(i,j))/4 +1) = cnt2((ne(i,j,1))/4+1)+1;
    end
end
ne = double(ne);
X1 = zeros(1,k);
for i=1:k
    [val,X2(i)] = max(cnt2);
    cnt2(X2(i))=0;
    X2(i) = 4*X2(i) -2;
end
subplot(2,2,3);
ne = uint8(ne);
imshow(ne);
title('Image After Contrasting');
%colorbar;
%subplot(2,2,4);
%%plot(X2);
ba2 = zeros(100,20);
%subplot(2,2,3);
for i=1:k
    for j=1:100
        for cl=1:20
            if j>=(i-1)*m && j<=i*m
                ba2(j,cl) = X2(i);
            end
        end
    end
end
ba2 = uint8(ba2);
subplot(2,2,4);
imshow(ba2);