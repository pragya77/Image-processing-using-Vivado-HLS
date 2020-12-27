#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void kmeans(short image_in[256][256],short final[256][256])
{
	short rows=256;
	short cols=256;
	short i,j,p,m,n,l,q,s,t;
	int k[4]={5,40,80,180};
	int mean[4];
	short ab[4];
	short r;
	short max_iterations=0;
	short min,mean1,mean2,mean3,mean4;
	short cluster=0;
	short cluster1[rows][cols];
	short cluster2[rows][cols];
	short cluster3[rows][cols];
	short cluster4[rows][cols];
	int size1=0;
	int size2=0;
	int size3=0;
	int size4=0;
	int sum1=0;
	int sum2=0;
	int sum3=0;
	int sum4=0;
	LOOP:
	i=0;
	j=0;
	p=0;
	m=0;
	n=0;
	l=0;
	q=0;
	s=0;
	t=0;
	for(s=0;s<256;s++)
	{
		for(t=0;t<256;t++)
		{
			cluster1[s][t]=0;
			cluster2[s][t]=0;
			cluster3[s][t]=0;
			cluster4[s][t]=0;
		}
	}
	size1=0;
	size2=0;
	size3=0;
	size4=0;
	sum1=0;
	sum2=0;
	sum3=0;
	sum4=0;
	for(i=0;i<rows;i++)
	{
		for(j=0;j<cols;j++)
		{
			r=image_in[i][j];
			//printf("input image pixel value at %d %d is %u\n",i,j,r);
			for(p=0;p<4;p++)
			{
			ab[p]=abs((r-k[p]));
			}
			min = ab[0];
			p=1;
			for (p = 1; p < 4; p++)
			{
			   if (ab[p] < min)
			      {
			           min = ab[p];
			           cluster=p;
			      }
		    }

			if (cluster==0)
			{
				cluster1[i][j]=r;
				size1++;

			}
			if (cluster==1)
			{
				cluster2[i][j]=r;
				size2++;
			}
			if(cluster==2)
			{
				cluster3[i][j]=r;
				size3++;
			}
			if(cluster==3)
			{
				cluster4[i][j]=r;
				size4++;
			}

		}
	}
printf("%d",size1);
for(m=0;m<rows;m++)
{
	for(n=0;n<cols;n++)
	{
		sum1=sum1+cluster1[m][n];
		sum2=sum2+cluster2[m][n];
		sum3=sum3+cluster3[m][n];
		sum4=sum4+cluster4[m][n];
	}
}

mean1=sum1/size1;
mean2=sum2/size2;
mean3=sum3/size3;
mean4=sum4/size4;
mean[0]=mean1;
mean[1]=mean2;
mean[2]=mean3;
mean[3]=mean4;
//printf("sum1=%d\n",sum1);
//printf("mean2=%d\n",mean2);
//if((mean[0]==k[0]) && (mean[1]==k[1]) && (mean[2]==k[2]) && (mean[3]==k[3]))
	for(l=0;l<rows;l++)
	{
		for(q=0;q<cols;q++)
		{

				{
				if((cluster1[l][q])>0)
				{
				cluster1[l][q]=50;
				}
				if((cluster2[l][q])>0)
				{
				cluster2[l][q]=70;
				}
				if((cluster3[l][q])>0)
				{
				cluster3[l][q]=40;
				}
				if((cluster4[l][q])>0)
				{
				cluster4[l][q]=220;
				}

				final[l][q]=cluster1[l][q]+cluster2[l][q]+cluster3[l][q]+cluster4[l][q];

				}
		}
	}
/*
else
{

k[0]=mean[0];
k[1]=mean[1];
k[2]=mean[2];
k[3]=mean[3];
max_iterations++;
if(max_iterations<100)
{
goto LOOP;
}
}
*/
//printf("output image pixel value at %d %d is %d\n",0,0,final[0][0]);
}
