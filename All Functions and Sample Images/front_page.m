Image_Location = input('Please Enter the Location of Image you want to Edit: ','s');
im= imread(Image_Location);
Function_Number= input('Please enter a function you want to perform:\n1.Adjust Brightness\n2.Adjust Contrast\n3.Histogram Equilization\n4.Image Compression\n5.Image Segmentation\n6.Number Plate Recognition\n7.Thumbnail Creator\n8.Resize and Crop\n');
switch Function_Number
    case 1
        Adjust_Brightness(im);
    case 2
        Adjust_Contrast(im);
    case 3
        Histogram_Equilization(im);
    case 4
        Image_Compression(im);
    case 5
        Image_Segmentation(im)
    case 6
        numberPlateExtraction(im)
    case 7
        Thumbnail_Creator(im)
    case 8
        ResizeAndCrop(im)
    otherwise
        disp('You have not selected a valid option.Please try again')
end