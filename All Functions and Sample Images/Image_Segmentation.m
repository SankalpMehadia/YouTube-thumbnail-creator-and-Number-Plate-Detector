function Image_Segmentation(im)
image=rgb2gray(im);
[m,n]=size(image);
[counts,intensity]=imhist(image);
probability=counts/(m*n);                      
cum_probability=cumsum(probability);                 
cum_mean=cumsum(probability.*intensity);       
m_g=cum_mean(end);                     
class_variation=zeros([length(intensity) 1]);
for i=1:length(intensity)
    class_variation(i)=(cum_probability(i)*((cum_mean(i)/cum_probability(i))-m_g)^2)+((1-cum_probability(i))*(((m_g-cum_mean(i))/(1-cum_probability(i)))-m_g)^2);
end
[~,threshold]=max(class_variation);           
threshold=threshold-1;
for i=1:m
    for j=1:n
        if image(i,j)>threshold
            image(i,j)=255;
        else
            image(i,j)=0;
        end
    end
end
imshow(image)
end