function N=Color_full(M)
global S
M=~M;
[a,b]=size(M);
N=[];
i=1;
j=1;

while i<a || j<b
        S=[];
        [Jn,Nn,in,jn]=Select(M,N,i);
        M=Jn;
        N=Nn;
        i=in;
        j=jn;
end
end