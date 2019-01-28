function [Posi_n, niu]=Choice_point(Posi,n,dist)
niu=0;
if n==1 && norm(dist)>0.4 && norm(dist)<0.8
    Posi_n=Posi+[1 0];
    niu=1;
elseif n==2 && norm(dist)>0.4*2^0.5/2 && norm(dist)<0.8*2^0.5/2
    Posi_n=Posi+[1 1];
    niu=1;
elseif n==3 && norm(dist)>0.4 && norm(dist)<0.8
    Posi_n=Posi+[0 1];
    niu=1;
elseif n==4 && norm(dist)>0.4*2^0.5/2 && norm(dist)<0.8*2^0.5/2
    Posi_n=Posi+[-1 1];
    niu=1;
elseif n==5 && norm(dist)>0.4 && norm(dist)<0.8
    Posi_n=Posi+[-1 0];
    niu=1;
elseif n==6 && norm(dist)>0.4*2^0.5/2 && norm(dist)<0.8*2^0.5/2
    Posi_n=Posi+[-1 -1];
    niu=1;
elseif n==7 && norm(dist)>0.4 && norm(dist)<0.8
    Posi_n=Posi+[0 -1];
    niu=1;
elseif n==8 && norm(dist)>0.4*2^0.5/2 && norm(dist)<0.8*2^0.5/2
    Posi_n=Posi+[1 -1];
    niu=1;
%     
elseif n==1 && norm(dist)>=0.8 && norm(dist)<1.2
    Posi_n=Posi+[2 0];
    niu=1;
elseif n==2 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[2 1];
    niu=1;
elseif n==3 && norm(dist)>=0.8*2^0.5/2 && norm(dist)<1.2*2^0.5/2
    Posi_n=Posi+[2 2];
    niu=1;
elseif n==4 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[1 2];
    niu=1;
elseif n==5 && norm(dist)>=0.8 && norm(dist)<1.2
    Posi_n=Posi+[0 2];
    niu=1;
elseif n==6 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[-1 2];
    niu=1;
elseif n==7 && norm(dist)>=0.8*2^0.5/2 && norm(dist)<1.2*2^0.5/2
    Posi_n=Posi+[-2 2];
    niu=1;
elseif n==8 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[-2 1];
    niu=1;
elseif n==9 && norm(dist)>=0.8 && norm(dist)<1.2
    Posi_n=Posi+[-2 0];
    niu=1;
elseif n==10 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[-2 -1];
    niu=1;
elseif n==11 && norm(dist)>=0.8*2^0.5/2 && norm(dist)<1.2*2^0.5/2
    Posi_n=Posi+[-2 -2];
    niu=1;
elseif n==12 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[-1 -2];
    niu=1;
elseif n==13 && norm(dist)>=0.8 && norm(dist)<1.2
    Posi_n=Posi+[0 -2];
    niu=1;
elseif n==14 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[1 -2];
    niu=1;
elseif n==15 && norm(dist)>=0.8*2^0.5/2 && norm(dist)<1.2*2^0.5/2
    Posi_n=Posi+[2 -2];
    niu=1;
elseif n==16 && norm(dist)>=0.8*5^0.5/2 && norm(dist)<1.2*5^0.5/2
    Posi_n=Posi+[2 -1];
    niu=1;
%     
elseif n==1 && norm(dist)>=1.2 && norm(dist)<6
    Posi_n=Posi+round(norm(dist)/0.8)*[2 0];
    niu=1;
elseif n==2 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[2 1];
    niu=1;
elseif n==3 && norm(dist)>=1.2*2^0.5/2 && norm(dist)<6*2^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*2^0.5/2)*[2 2];
    niu=1;
elseif n==4 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[1 2];
    niu=1;
elseif n==5 && norm(dist)>=1.2 && norm(dist)<6
    Posi_n=Posi+round(norm(dist)/0.8)*[0 2];
    niu=1;
elseif n==6 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[-1 2];
    niu=1;
elseif n==7 && norm(dist)>=1.2*2^0.5/2 && norm(dist)<6*2^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*2^0.5/2)*[-2 2];
    niu=1;
elseif n==8 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[-2 1];
    niu=1;
elseif n==9 && norm(dist)>=1.2 && norm(dist)<6
    Posi_n=Posi+round(norm(dist)/0.8)*[-2 0];
    niu=1;
elseif n==10 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[-2 -1];
    niu=1;
elseif n==11 && norm(dist)>=1.2*2^0.5/2 && norm(dist)<6*2^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*2^0.5/2)*[-2 -2];
    niu=1;
elseif n==12 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[-1 -2];
    niu=1;
elseif n==13 && norm(dist)>=1.2 && norm(dist)<6
    Posi_n=Posi+round(norm(dist)/0.8)*[0 -2];
    niu=1;
elseif n==14 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[1 -2];
    niu=1;
elseif n==15 && norm(dist)>=1.2*2^0.5/2 && norm(dist)<6*2^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*2^0.5/2)*[2 -2];
    niu=1;
elseif n==16 && norm(dist)>=1.2*5^0.5/2 && norm(dist)<6*5^0.5/2
    Posi_n=Posi+round(norm(dist)/0.8*5^0.5/2)*[2 -1];
    niu=1;
else
    Posi_n=Posi;
end
end