clear
clc
tic

M=imread('1.jpg');
subplot(2,2,1)
imshow(M)

K1(:,:,1)=uint8(M(:,:,1)>210).*uint8(M(:,:,1)<225);
K1(:,:,2)=uint8(M(:,:,2)>210).*uint8(M(:,:,2)<225);
K1(:,:,3)=uint8(M(:,:,3)>210).*uint8(M(:,:,3)<225);
N1=K1(:,:,1)|K1(:,:,2)|K1(:,:,3);
P=medfilt2(N1);

K2(:,:,1)=uint8(M(:,:,1)>80).*uint8(M(:,:,1)<100);
K2(:,:,2)=uint8(M(:,:,2)>80).*uint8(M(:,:,2)<100);
K2(:,:,3)=uint8(M(:,:,3)>80).*uint8(M(:,:,3)<100);
N2=(K2(:,:,1)>0)&(K2(:,:,2)>0)&(K2(:,:,3)>0);
subplot(2,2,2)
J=medfilt2(N2);

K5(:,:,1)=uint8(M(:,:,1)>220);
K5(:,:,2)=uint8(M(:,:,2)>220);
K5(:,:,3)=uint8(M(:,:,3)<50);
N5=(K5(:,:,1)>0)&(K5(:,:,2)>0)&(K5(:,:,3)>0);
Q=medfilt2(N5);

M_road=medfilt2(J+P+Q);
imshow(M_road)

subplot(2,2,3)
K6(:,:,1)=uint8(M(:,:,1)>190).*uint8(M(:,:,1)<210);
K6(:,:,2)=uint8(M(:,:,2)>190).*uint8(M(:,:,2)<210);
K6(:,:,3)=uint8(M(:,:,3)>190).*uint8(M(:,:,3)<210);
N6=(K6(:,:,1)>0)&(K6(:,:,2)>0)&(K6(:,:,3)>0);
imshow(medfilt2(medfilt2(N6)))

M=imread('1.png');

K3(:,:,1)=uint8(M(:,:,1)<10);
K3(:,:,2)=uint8(M(:,:,2)<10);
K3(:,:,3)=uint8(M(:,:,3)>240);
N3=(K3(:,:,1)>0)&(K3(:,:,2)>0)&(K3(:,:,3)>0);

K4(:,:,1)=uint8(M(:,:,1)>220);
K4(:,:,2)=uint8(M(:,:,2)<50);
K4(:,:,3)=uint8(M(:,:,3)<50);
N4=(K4(:,:,1)>0)&(K4(:,:,2)>0)&(K4(:,:,3)>0);
subplot(2,2,4)
J1=medfilt2(N3);
J2=medfilt2(N4);
imshow(J1+J2)

A=[420.4225	655	113
428.355	1494	333
506.0935	1337	597
417.2495	723	579
417.2495	825	640
417.2495	948	146
298.262	331	694];
[a,b]=size(M_road);
[c,~]=size(A);
lambda=0.6;
Y=zeros(a,b);
Peo=zeros(a,b);
t=5000;
const=exp(-(t/10000-lambda).^2);
for i=1:1:a
    for j=1:1:b
        if M_road(i,j)==1
            p=0;
            for k=1:1:c
                r=norm(0.4*[i-A(k,3) j-A(k,2)]);
                y=0.3*exp(-(r/A(k,1)*40-lambda).^2);
                p=p+const*y;
            end
            p=p+const*5000/983286;
            Y(i,j)=p;
            if rand>1-p
                Peo(i,j)=1;
            end
        end
    end
end
clf
imshow(Peo)
sum(sum(Peo))