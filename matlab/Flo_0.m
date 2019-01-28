function [M_road, M_Cas, Cas_in, Cas_out, Peo_M, Peo_pos, Num_per]=Flo_0
M=imread('0.jpg');

K1(:,:,1)=uint8(M(:,:,1)>195).*uint8(M(:,:,1)<210);
K1(:,:,2)=uint8(M(:,:,2)>195).*uint8(M(:,:,2)<210);
K1(:,:,3)=uint8(M(:,:,3)>195).*uint8(M(:,:,3)<210);
N1=K1(:,:,1)|K1(:,:,2)|K1(:,:,3);
P=medfilt2(N1);

K2(:,:,1)=uint8(M(:,:,1)>40).*uint8(M(:,:,1)<70);
K2(:,:,2)=uint8(M(:,:,2)>40).*uint8(M(:,:,2)<70);
K2(:,:,3)=uint8(M(:,:,3)>40).*uint8(M(:,:,3)<70);
N2=(K2(:,:,1)>0)&(K2(:,:,2)>0)&(K2(:,:,3)>0);
J=medfilt2(N2);

K5(:,:,1)=uint8(M(:,:,1)>220);
K5(:,:,2)=uint8(M(:,:,2)>220);
K5(:,:,3)=uint8(M(:,:,3)<50);
N5=(K5(:,:,1)>0)&(K5(:,:,2)>0)&(K5(:,:,3)>0);
Q=medfilt2(N5);
M_road=medfilt2(P+J+Q);

K6(:,:,1)=uint8(M(:,:,1)>150).*uint8(M(:,:,1)<200);
K6(:,:,2)=uint8(M(:,:,2)>150).*uint8(M(:,:,2)<200);
K6(:,:,3)=uint8(M(:,:,3)>150).*uint8(M(:,:,3)<200);
N6=(K6(:,:,1)>0)&(K6(:,:,2)>0)&(K6(:,:,3)>0);
M_Cas=medfilt2(medfilt2(N6));
M=imread('out.png');

K3(:,:,1)=uint8(M(:,:,1)<10);
K3(:,:,2)=uint8(M(:,:,2)<10);
K3(:,:,3)=uint8(M(:,:,3)>240);
N3=(K3(:,:,1)>0)&(K3(:,:,2)>0)&(K3(:,:,3)>0);

K4(:,:,1)=uint8(M(:,:,1)>220);
K4(:,:,2)=uint8(M(:,:,2)<50);
K4(:,:,3)=uint8(M(:,:,3)<50);
N4=(K4(:,:,1)>0)&(K4(:,:,2)>0)&(K4(:,:,3)>0);
Cas_out=medfilt2(N3);
Cas_in=medfilt2(N4);

A=[439.4605	1037	203
349.03	822	180
428.355	1494	333
412.49	1239	577
404.5575	646	608
344.2705	1022	638
393.452	732	556
422.009	361	677
352.203	310	654];
[a,b]=size(M_road);
[c,~]=size(A);
lambda=0.6;
Y=zeros(a,b);
Peo_M=zeros(a,b);
Peo_pos=[];
t=5000;
const=exp(-(t/10000-lambda).^2);
for i=2:1:a-1
    for j=2:1:b-1
        if M_road(i,j)==1 && M_road(i-1,j) && M_road(i-1,j-1)...
                && M_road(i-1,j+1) && M_road(i,j-1) && M_road(i,j+1) && M_road(i+1,j-1)...
                && M_road(i+1,j) && M_road(i+1,j+1)
            p=0;
            for k=1:1:c
                r=norm(0.4*[i-A(k,3) j-A(k,2)]);
                y=0.3*exp(-(r/A(k,1)*40-lambda).^2);
                p=p+const*y;
            end
            p=p+const*5000/983286;
            Y(i,j)=p;
            if rand>1-p
                Peo_M(i,j)=1;
                Peo_pos=[Peo_pos;[i j]];
            end
        end
    end
end
Num_per=sum(sum(Peo_M));
end