function A = Most_frequent_color(rgbImage)
%rgbImage = imread('bg.jpg');
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
R = 4*pos1-2;
G = 4*pos2-2;
B = 4*pos3-2;
for i=1:d(1,1)
    for j=1:d(1,2)
        rgbImage(i,j,1)=R;
        rgbImage(i,j,2)=G;
        rgbImage(i,j,3)=B;
    end
end
imshow(rgbImage);