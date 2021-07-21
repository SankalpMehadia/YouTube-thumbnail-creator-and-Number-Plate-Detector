function Adjust_Brightness(im)
    x=input('What do you want to do?\n1.Increase Brightness\n2.Decrease Brightness\n');
    if x>2
        disp('Invalid Input');
    end
    im=imresize(im,[720 1280]);
    img=rgb2gray(im);
    inbr=zeros(720,1280); 
    debr=zeros(720,1280); 

    for c=1:720 
        for d=1:1280 
            inbr(c,d)=img(c,d)+50; 
            debr(c,d)=img(c,d)-50 ; 
        end
    end
    inbr=uint8(inbr); 
    debr=uint8(debr);     
    if x==1
        imshow(inbr);
    else if x==2
         imshow(debr)
        end
    end
end