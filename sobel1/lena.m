pic1=imread('W:\Desktop\sobel1\lena.jpg');

pic2=imresize(pic1,[256 256]);
figure;
imshow(pic2);

pic3=rgb2gray(pic2);
figure;
imshow(pic3);

pic_gray1 = pic3';
pic_gray1 = pic_gray1(:)';
%writematrix(pic_gray1,'W:\Desktop\kmeans\pic.txt');



