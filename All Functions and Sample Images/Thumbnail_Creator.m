function Thumbnail_Creator(im)
    im=rgb2gray(im);
    [rows,cols]=size(im);
    answer=input('Do you want to add text?\n1.YES\n2.NO\n');
    if answer==1
            disp(size(im));
        x=input('Please Enter Starting x position: ');
        if x>cols
            disp('Invalid enter again');
            x=input('Please Enter Starting x position: ');
        end
        y=input('Please Enter Starting y position: ');
        if y>rows
            disp('Invalid enter again');
            y=input('Please Enter Starting y position: ');
        end
        pos=[x y];
        str=input('Please enter text you want to add: ','s');
        fsize=input('Please enter font size: ');
        tcolor=input('Please enter text color: ','s');
        b=input('Do you want box color?\n1.YES\n2.NO\n');
            if b==1
                bcolor=input('Please enter box color: ','s');
                output=insertText(im,pos,str,'FontSize',fsize,'TextColor',tcolor,'BoxColor',bcolor);
            end
            if b==2
                output=insertText(im,pos,str,'FontSize',fsize,'TextColor',tcolor);
            end
            Image=output;
            if size(Image,3)==3
            Image=rgb2gray(Image);
            end
            [m n r]=size(Image);
            rgb=zeros(m,n,3); 
            rgb(:,:,1)=Image;
            rgb(:,:,2)=rgb(:,:,1);
            rgb(:,:,3)=rgb(:,:,1);
            Image=rgb/255; 
            figure,imshow(Image);
    end
    answer=input('Do you want to add another image?\n1.YES\n2.NO\n');
    if answer==1
        disp(size(im));
        str=input('Enter the location: ','s');
        B=imread(str);
        B=rgb2gray(B);
        disp(size(B))
        [u,v]=size(im);
        x=input('Please Enter Starting x position: ');
        y=input('Please Enter Starting y position: ');
        [r,c]=size(B);
        if x+r>u||y+c>v
            disp("Incorrect Input");
            return
        end
        newimg=zeros(u,v);
        for i=1:r
            for j=1:c
                newimg(i+x,j+y)=B(i,j)+1;
            end
        end
        for i=1:u
            for j=1:v
                if newimg(i,j)==0
                    newimg(i,j)=im(i,j);
                end
            end
        end
        newimg = uint8(newimg);
        imshow(newimg);
    end
end