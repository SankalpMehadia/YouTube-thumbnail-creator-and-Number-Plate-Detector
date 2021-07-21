function outputpic= Histogram_Equilization(im)
inputpic=rgb2gray(im);
L=256; 
c=zeros(256,1); 
for i=0:255 
    c(i+1)=sum(sum(inputpic==i)); 
end 
p=c/(size(inputpic,1)*size(inputpic,2));
s=(L-1)*cumsum(p); 
s=round(s); 
outputpic=uint8(zeros(size(inputpic)));
for k=1:size(s,1) 
    outputpic(inputpic==k-1)=s(k); 
end 
imshow(outputpic);
end
