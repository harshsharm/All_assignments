function im = linContrastStretching(im,a,b)
mini = 256;
maxi = -1;
if size(im,3) == 3
    ne = rgb2gray(im);
else
    ne=im;
end
subplot(1,2,1);
imshow(ne);
title('Image Before Contrasting');
%colorbar;
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
%[idx2,X2] = kmeans(ne(:),5);
%X2 = uint64(X2);
ne = uint8(ne);
subplot(1,2,2);
imshow(ne);
title('Image After Contrasting');
%colorbar;
%subplot(2,2,4);
%%plot(X2);