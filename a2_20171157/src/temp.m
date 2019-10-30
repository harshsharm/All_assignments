% Apply various filters and compare the outcomes 
% "Im" is the image input 
% "n" is the n*n window size of the filter : Usually 3*3
function Filters(im)
[M,N]=size(im);
%Converting the image into 16 bit type image .
im=im2uint16(im);

% Creating empty image matrices 
Ipad=zeros(M+2,N+2);
Iprx=zeros(M,N);
Ipry=zeros(M,N);
Il=zeros(M,N);
Izx=zeros(M,N);
Izy=zeros(M,N);
Ild=zeros(M,N);
Irx=zeros(M,N);
Iry=zeros(M,N);


%Creating masks  1.Prewitt Filter - X&Y 
Prx=[-1 0 1;-1 0 1;-1 0 1];
Pry=[ 1 1 1;0 0 0;-1,-1,-1];
%Creating masks 2.Sobel Filter- X&Y 
Sobelx=[-1 0 1; -2 0 2;-1 0 1];
Sobely=[1 2 1; 0 0 0; -1 -2 -1];
%Laplacian Mask 
Laplacian=[0 -1 0; -1 4 -1; 0 -1 0];
%Laplacian +Diagonals 
LaplacianDiag=[-1 -1 -1 ;-1 8 -1;-1 -1 -1];

%Roberts Filter  (Making it 3*3 to fit in the code)
Rx=[0 1 0;-1 0 0;0 0 0];
Ry=[1 0 0;0 -1 0;0 0 0];

% Padding of the Image ( Window size is 3 ) 
for i=2:M-1
    for j=2:N-1
        Ipad(i,j)=im(i,j);
    end
end
% Intialising variables 
s=0;
p=0;
zx=0;
zy=0;
l=0;
ld=0;
rx=0;
ry=0;
%Mask Moving
for r=2:M
    for c=2:N
        posx=r;
        posy=c;
        for i=-1:1
            for j=-1:1
                s=s+Ipad(posx+i,posy+j)*(Prx(i+2,j+2));
                p=p+Ipad(posx+i,posy+j)*(Pry(i+2,j+2));
                zx=zx+Ipad(posx+i,posy+j)*(Sobelx(i+2,j+2));
                zy=zy+Ipad(posx+i,posy+j)*(Sobely(i+2,j+2));
                l=l+Ipad(posx+i,posy+j)*(Laplacian(i+2,j+2));
                ld=ld+Ipad(posx+i,posy+j)*(LaplacianDiag(i+2,j+2));
                rx=rx+Ipad(posx+i,posy+j)*(Rx(i+2,j+2));
                ry=ry+Ipad(posx+i,posy+j)*(Ry(i+2,j+2));
                
            end
        end
        Iprx(posx,posy)=s;
        Ipry(posx,posy)=p;
        Izx(posx,posy)=zx;
        Izy(posx,posy)=zy;
        Il(posx,posy)=l;
        Ild(posx,posy)=ld;
        Irx(posx,posy)=rx;
        Iry(posx,posy)=ry;
        zx=0;
        zy=0;
        l=0;
        ld=0;
        s=0;
        p=0;
        rx=0;
        ry=0;
    end
end

%Converting back to 8-bit images
Iprx=im2uint8(Iprx);
Ipry=im2uint8(Ipry);
Izx=im2uint8(Izx);
Izy=im2uint8(Izy);
Il=im2uint8(Il);
Ild=im2uint8(Ild);
Irx=im2uint8(Irx);
Iry=im2uint8(Iry);


%Plotting of all these images.
figure

subplot(4,3,1)
imshow(im)
title('Original image');


subplot(4,3,2)
imshow(Iprx)
title('Prewitt-X image');


subplot(4,3,3)
imshow(Ipry)
title('Prewitt -Y image');

I=Iprx+Ipry;
subplot(4,3,4)
imshow(I)
title('Total Prewitt Image');

subplot(4,3,5)
imshow(Izx)
title('Sobel X Image');

subplot(4,3,6)
imshow(Izy)
title('Sobel Y Image');

In=Izx+Izy;
subplot(4,3,7)
imshow(In)
title('Total Sobel Image');

subplot(4,3,8)
imshow(Il)
title('Laplacian Image');

subplot(4,3,9)
imshow(Ild)
title('Laplacian with Diagonal Image');

subplot(4,3,10)
imshow(Irx)
title('Roberts X Image');

subplot(4,3,11)
imshow(Iry)
title('Roberts Y Image');

I3=Irx+Iry;
subplot(4,3,12)
imshow(I3)
title('Total Roberts filtered Image');

end
       
