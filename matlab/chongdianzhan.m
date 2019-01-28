clear
clc
tic

global S
A=imread('today-northamerica.jpg');
K1=medfilt2(A(:,:,3)>50);
J=K1;
[a,b]=size(J);
N=[];
i=1;
j=1;
J(1,1)=1;
J(1,b)=1;
J(a,1)=1;
J(a,b)=1;

while i<a || j<b
        S=[];
        [Jn,Nn,in,jn]=Select(J,N,i);
        J=Jn;
        N=Nn;
        i=in;
        j=jn;
        [i a j b]
end










toc
