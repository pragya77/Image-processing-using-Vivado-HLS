#include <stdio.h>
#include <stdlib.h>

int main()
{

    int input_image[256][256],output_image[256][256];
    int i;
    int j;

    FILE *fp1;
    char oneword[65536];


    fp1 = fopen("W:\\Desktop\\sobel\\lena.txt", "r");
    label:
    for(i=0;i<256; i++)
    {
        for(j=0;j<256;j++)
        {
         fscanf(fp1, "%s", oneword);
        input_image[i][j] = atoi(oneword);

        }
    }

    fclose(fp1);
    sobel(input_image,output_image);
   // printf("input image pixel value at %d %d is %d\n",57,50,input_image[57][50]);
    return 0;
}


