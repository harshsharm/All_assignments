function img = bilateral_filter(window_size,r_sigma,d_sigma,img)
x=mesh(window_size);
y=x';
Domain_kernal=gauss(x,y,d_sigma);
d = size(img);
for r=1:d(1,1)
    for c=1:d(1,2)
        
        cmin=maxi(c-window_size,1);
        
        cmax=mini(c+window_size,d(1,2));
        
        rmin=maxi(r-window_size,1);

        rmax=mini(r+window_size,d(1,1));
        
        img1=img(rmin:rmax,cmin:cmax);
        
        Range_kernal = gauss2(img1,img(r,c),r_sigma);
        
        t1 = (rmin:rmax) -r+window_size+1;
        
        t2 = (cmin:cmax) -c+window_size+1;
        
        Bilateral_filt=Range_kernal.*Domain_kernal(t1,t2);
        
        sumi = sum(Bilateral_filt(:)');
        
        sumi = double(sumi);
        
        t3 = Bilateral_filt.*img1;
        
        su = sum(t3(:));
        su = double(su);
        img(r,c)=su/sumi;
    end
end

end


