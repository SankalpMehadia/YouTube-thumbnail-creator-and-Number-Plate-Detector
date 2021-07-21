function ResizeAndCrop(im)
        im=rgb2gray(im);
        disp(size(im));
    answer=input('Do you want to resize?\n1.YES\n2.NO\n')
    if answer==1
        x=input('Please enter number of coloums you want: ');
        y=input('Please enter number of rows you want: ');
        dim=[y,x];
        output=imresize(im,dim);
        imshow(output);
    end
    answer=input('Do you want to crop?\n1.YES\n2.NO\n')
    if answer==1
        disp(size(im));
        xmin=input('Please enter stating x cordinate: ');
        ymin=input('Please enter starting y cordinate: ');
        w=input('Please enter width: ');
        h=input('Please enter height: ');
        dim=[xmin ymin w h];
        output=imcrop(im,dim);
        imshow(output);
    end
end