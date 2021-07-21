function Image_Compression(im)
gray_image=rgb2gray(im);
[rows,colm]=size(gray_image);
edited=zeros(rows,colm);
for k=1:colm
    prev=zeros(1,4);
    for j=1:rows
       if gray_image(j,k)>=240
          prev = zeros(1,4);
       end
       bin=d2b(gray_image(j,k));
       [prev,carry]=add(bin,prev);
       edited(j,k)=next(bin,carry);   
    end
end
I = mat2gray(edited,[0 15]);

imshow(I);


function  binary= d2b(integer)
binary=zeros(1,8);
for i=0:7
   if mod(integer,2^(i+1))>=2^i 
      binary(i+1)=1;
   else
      binary(i+1)=0;
   end
end
end
function [sum,carry]=add(b1,b2)
sum=zeros(1,4);
carry=0;
for i=1:4
    if (b1(i)+b2(i)+carry)<=1
        sum(i)=b1(i)+b2(i)+carry;
        carry=0;
    else
        if (b1(i)+b2(i)+carry)==2
            sum(i)=0;
            carry=1;
        else
            sum(i)=1;
            carry=1;
        end
    end
end
end
function val =next(b1,forward)
    total=0;
    for i=5:8
        total=b1(i)*2^(i-5)+total;
    end
    if total+forward>15
        val=15;
    else
        val=total+forward;
    end
end
end