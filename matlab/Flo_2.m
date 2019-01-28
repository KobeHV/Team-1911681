function [M_road, M_Cas, Cas_in, Cas_out, Peo_M, Peo_pos, Num_per]=Flo_2

M=imread('2.jpg');

K1(:,:,1)=uint8(M(:,:,1)>195).*uint8(M(:,:,1)<205);
K1(:,:,2)=uint8(M(:,:,2)>195).*uint8(M(:,:,2)<205);
K1(:,:,3)=uint8(M(:,:,3)>195).*uint8(M(:,:,3)<205);
N1=K1(:,:,1)|K1(:,:,2)|K1(:,:,3);
P=medfilt2(N1);
K2(:,:,1)=uint8(M(:,:,1)>45).*uint8(M(:,:,1)<70);
K2(:,:,2)=uint8(M(:,:,2)>45).*uint8(M(:,:,2)<70);
K2(:,:,3)=uint8(M(:,:,3)>45).*uint8(M(:,:,3)<70);
N2=(K2(:,:,1)>0)&(K2(:,:,2)>0)&(K2(:,:,3)>0);
J=medfilt2(N2);

K5(:,:,1)=uint8(M(:,:,1)>220);
K5(:,:,2)=uint8(M(:,:,2)>220);
K5(:,:,3)=uint8(M(:,:,3)<50);
N5=(K5(:,:,1)>0)&(K5(:,:,2)>0)&(K5(:,:,3)>0);
Q=medfilt2(N5);
M_road=(medfilt2(J+P+Q));

K6(:,:,1)=uint8(M(:,:,1)>170).*uint8(M(:,:,1)<180);
K6(:,:,2)=uint8(M(:,:,2)>170).*uint8(M(:,:,2)<180);
K6(:,:,3)=uint8(M(:,:,3)>170).*uint8(M(:,:,3)<180);
N6=(K6(:,:,1)>0)&(K6(:,:,2)>0)&(K6(:,:,3)>0);
M_Cas=medfilt2(medfilt2(N6));

M=imread('2.png');

K3(:,:,1)=uint8(M(:,:,1)<10);
K3(:,:,2)=uint8(M(:,:,2)<10);
K3(:,:,3)=uint8(M(:,:,3)>240);
N3=(K3(:,:,1)>0)&(K3(:,:,2)>0)&(K3(:,:,3)>0);
Cas_in=medfilt2(N3);
Cas_out=medfilt2(N3)*0;

A=[437.874	832	204
444.22	832	204
364.895	1562	773];
[a,b]=size(M_road);
[c,~]=size(A);
lambda=0.6;
Y=zeros(a,b);
Peo_M=zeros(a,b);
Peo_pos=[];
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
                Peo_M(i,j)=1;
                Peo_pos=[Peo_pos;[i j]];
            end
        end
    end
end
Num_per=sum(sum(Peo_M));
end