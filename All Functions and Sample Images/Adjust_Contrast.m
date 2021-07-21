function Adjust_Contrast(im)
    x=input('What do you want to do?\n1.Increase contrast\n2.Decrease contrast\n');
    if x>2
        disp('Invalid Input');
    end
    im=imresize(im,[720 1280]);
    img=rgb2gray(im);
    inct=zeros(720,1280); 
    dect=zeros(720,1280); 
    for c=1:720 
        for d=1:1280 
            if img(c,d)<128 
            dect(c,d)=img(c,d)+((128-img(c,d))/2);
            else 
            dect(c,d)=img(c,d)-((img(c,d)-128)/2);
            end 
            inct(c,d)=1.2*(img(c,d)-31);
        end 
    end 
    inct=uint8(inct); 
    dect=uint8(dect); 
    if x==1
        imshow(inct);
    else if x==2
         imshow(dect)
        end
    end
end