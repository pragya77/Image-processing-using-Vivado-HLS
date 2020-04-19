data=load('W:\Desktop\kmeans\kmeans.dat');
data=transpose(data);
data1=reshape(data,256,256);
data1=transpose(data1);
figure;
imshow(uint8(data1));
   
