#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void sobel(int input_image[256][256],int output_image[256][256])
{

	int k,l,c,d;
	int image[256][256];
	int i;
	int j;
	int max,min;

	//int Gx[3][3] = {{-1,0,1},{-2,0,2},{-1,0,1}};//horizontal mask
	//int Gy[3][3] = {{1,2,1},{0,0,0},{-1,-2,-1}};//vertical mask
	int x_dir,y_dir,edge_weight;
	x_dir = 0;
	y_dir = 0;
//sobel edge detection algorithm
for(i=0;i<256;i++)
 {
	for(j=0;j<256;j++)
	{
		if((i > 0 && (i < (256-1)) && (j > 0) && (j < (256-1))))// to exclude the first and last columns and first and last rows as we cannot do convolution at these places
		{
			x_dir=-1*input_image[i-1][j-1]+0*input_image[i-1][j]+input_image[i-1][j+1]-2*input_image[i][j-1]+0*input_image[i][j]+2*input_image[i][j+1]-1*input_image[i+1][j-1]+0*input_image[i+1][j]+input_image[i+1][j+1];
			y_dir=1*input_image[i-1][j-1]+2*input_image[i-1][j]+input_image[i-1][j+1]+0*input_image[i][j-1]+0*input_image[i][j]+0*input_image[i][j+1]-1*input_image[i+1][j-1]-2*input_image[i+1][j]-1*input_image[i+1][j+1];
			edge_weight = abs(x_dir) + abs(y_dir);
			image[i][j] = edge_weight;
			//printf("%d\n",image[i][j]);
		}
		if(i==0)//for first row
		{
			output_image[i][j]=0;
		}
		if(i==255)//for last row
		{
			output_image[i][j]=0;
		}

		if(j==0)//for first column
		{
			output_image[i][j]=0;
		}
		if(j==255)//for last column
		{
			output_image[i][j]=0;
		}
	}
 }

//linear transformation to convert the range to 0-255 pixel value
max = image[1][1];
min = image[1][1];
  //finding minimum and maximum values
for (c = 1; c < 255; c++)
	{
    	for (d = 1; d < 255; d++)
    	{
    		if (image[c][d] > max)
    		{
    			max = image[c][d];

    		}
    		if(image[c][d]<min)
    		{
    			min=image[c][d];
    		}
    	}
	}
//printf("%d\n",max);
//printf("%d\n",min);
  //actual linear transformation equation
for(k=1;k<255;k++)
	{
		for(l=1;l<255;l++)
		{
			output_image[k][l]=((255 * image[k][l])/(max-min));

		}
	}

//printf("output image pixel value at %d %d is %d\n",57,50,output_image[57][50]);
}
