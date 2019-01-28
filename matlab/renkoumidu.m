clear
clc
tic

A=imread('zx.png');
K1=medfilt2(A(:,:,1)>50);
[a,b]=size(K1);
Q=sum(sum(K1));
dS=7979316/Q;
Save=[];
for i=1:2:a-1
    for j=1:2:b-1
        if K1(i,j)==1 || K1(i,j+1)==1 || K1(i+1,j)==1 || K1(i+1,j+1)==1
            P=([i;j]*K1(i,j)+[i;j+1]*K1(i,j+1)+[i+1;j]*K1(i+1,j)+[i+1;j+1]*K1(i+1,j+1))/(K1(i,j)+K1(i,j+1)+K1(i+1,j)+K1(i+1,j+1));
            P=(P-[90;78]).*[-24/411.3333;52/669.5]+[49;-125];
            S=(K1(i,j)+K1(i,j+1)+K1(i+1,j)+K1(i+1,j+1))*dS;
            Save=[Save [P/180*pi;S]];
        end
    end
end
plot(Save(2,:),Save(1,:),'*')
[~,b]=size(Save);
X=zeros(b,1);
Y=zeros(b,1);
Z=zeros(b,1);
for i=1:1:b
    x=Save(2,i);
    y=Save(1,i);
    z=density(x,y)*Save(3,i);
    X(i)=x;
    Y(i)=y;
    Z(i)=z;
end
dP=(3.257e8-sum(Z))/7979316;
for i=1:1:b
    x=Save(2,i);
    y=Save(1,i);
    z=Z(i)+dP*Save(3,i);
    X(i)=x;
    Y(i)=y;
    Z(i)=z;
end
plot3(X,Y,Z,'*')












toc