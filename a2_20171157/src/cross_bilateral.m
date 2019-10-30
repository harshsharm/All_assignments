function img = cross_bilateral(window_size,r_sigma,d_sigma,img,Img)
x=mesh(window_size);
y=x';
Domain_kernal=gauss(x,y,d_sigma);
d = size(img);
for i=1:d(1,1)
    for j=1:d(1,2)
        
        cmin=maxi(j-window_size,1);
        
        cmax=mini(j+window_size,d(1,2));
        
        rmin=maxi(i-window_size,1);

        rmax=mini(i+window_size,d(1,1));
        
        img1=img(rmin:rmax,cmin:cmax);
        img2=Img(rmin:rmax,cmin:cmax);
        
        Range_kernal = gauss2(img1,img(i,j),r_sigma);
        
        t1 = (rmin:rmax) -i+window_size+1;
        
        t2 = (cmin:cmax) -j+window_size+1;
        
        Bilateral_filt=Range_kernal.*Domain_kernal(t1,t2);
        
        sumi = sum(Bilateral_filt(:)');
        
        sumi = double(sumi);
        
        t3 = Bilateral_filt.*img2;
        
        su = sum(t3(:));
        su = double(su);
        img(i,j)=su/sumi;
    end
end

end

