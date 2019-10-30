function img = mergeImage_own(rgbImage,img)
%clc;
%clearvars;
%rgbImage = imread('fg.jpg');
a = rgbImage;
a = double(a);
d = size(rgbImage);
%histogram(rgbImage);
redChannel = rgbImage(:, :, 1);
Rs = size(redChannel);
greenChannel = rgbImage(:, :, 2);
Gs= size(greenChannel);
blueChannel = rgbImage(:, :, 3);
Bs= size(blueChannel);
%rgbImage = cat(3, redChannel, greenChannel, blueChannel);
rgbImage = [redChannel(:), greenChannel(:), blueChannel(:)];
%d = size(rgbImage);
rgbImage = double(rgbImage);
[idx, X] = kmeans(rgbImage,5);
%imshow(rgbImage);
%figure;
%plot(idx);
M = mode(idx);
X=int32(X);
R=X(M,1);
G=X(M,2);
B=X(M,3);
%img = imread('q3_C.jpg');
img = uint8(img);
si = size(img);
for i=1:d(1,1)
    for j=1:d(1,2)
        if ((R-a(i,j,1))^2 + (G-a(i,j,2))^2 + (B-a(i,j,3))^2)>30000
            img(i,j,1)=a(i,j,1);
            img(i,j,2)=a(i,j,2);
            img(i,j,3)=a(i,j,3);
        end
    end
end
imshow(img);