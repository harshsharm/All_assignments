function img = mergeImage(rgbImage,img)
%rgbImage = imread('fg.jpg');
a = rgbImage;
a = double(a);
rgbImage = uint8(rgbImage);
cnt1 = zeros(1,65);
cnt2 = zeros(1,65);
cnt3 = zeros(1,65);
d = size(rgbImage);
for i=1:3
    for j=1:d(1,1)
        for k = 1:d(1,2)
            if i == 1
                cnt1((rgbImage(j,k,1))/4 +1) = cnt1((rgbImage(j,k,1))/4+1)+1;
            end
            if i == 2
                cnt2((rgbImage(j,k,2))/4 +1) = cnt2((rgbImage(j,k,2))/4+1)+1;
            end
            if i == 3
                cnt3((rgbImage(j,k,3))/4 +1) = cnt3((rgbImage(j,k,3))/4+1)+1;
            end
        end
    end
end
maxi1=0;
pos1=0;
pos2=0;
pos3=0;
maxi2=0;
maxi3=0;
for i=1:3
    for j=1:65
        if i==1
            if maxi1 <cnt1(j)
                maxi1 = cnt1(j);
                pos1 = j;
            end
        end
        if i==2
            if maxi2 <cnt2(j)
                maxi2 = cnt2(j);
                pos2 = j;
            end
        end
        if i==3
            if maxi3 <cnt3(j)
                maxi3 = cnt3(j);
                pos3 = j;
            end
        end
    end
end
R = int32(4*pos1-2);
G = int32(4*pos2-2);
B = int32(4*pos3-2);
%R = int32(21)
%G = int32(255)
%B = int32(8)
%img = imread('bg.jpg');
img = uint8(img);
d = size(img);
for i=1:d(1,1)
    for j=1:d(1,2)
        if ((R-a(i,j,1))^2 + (G-a(i,j,2))^2 + (B-a(i,j,3))^2)>35000
            img(i,j,1)=a(i,j,1);
            img(i,j,2)=a(i,j,2);
            img(i,j,3)=a(i,j,3);
        end
    end
end
imshow(img);