#include <stdio.h>
#include <stdlib.h>

int main()
{

    short input_image[256][256],output_image[256][256];
    int i;
    int j;

    FILE *fp1;
    char oneword[65536];


    fp1 = fopen("W:\\Desktop\\kmeans\\pic.txt", "r");
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
    //printf("input image pixel value at %d %d is %u\n",0,0,input_image[0][0]);
    kmeans(input_image,output_image);

    return 0;
}


