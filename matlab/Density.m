function a_d=Density(M,position)
[a,b]=size(M);
tau=3;
S=zeros(4,1);
Num=zeros(4,1);
V=[sqrt(2)/2 sqrt(2)/2
    -sqrt(2)/2 sqrt(2)/2
    -sqrt(2)/2 -sqrt(2)/2
    sqrt(2)/2 -sqrt(2)/2];
H=zeros(2*tau+1,2*tau+1);
if position(1)-tau>0 && position(2)-tau>0 && position(1)+tau<a && position(2)+tau<b
    for i=1:1:2*tau+1
        for j=1:1:2*tau+1
            if M(position(1)-tau-1+i,position(2)-tau-1+j)==1 && i~=tau+1 && j~=tau+1
                H(i,j)=1;
                vect=[-tau-1+i,-tau-1+j];
                for k=1:1:4
                    S(k)=V(k,:)*vect'/norm(vect);
                end
                [w,m]=max(S);
                if sum(w==S)>1
                    m=0;
                end
                switch m
                    case 1
                        Num(1)=Num(1)+1;
                    case 2
                        Num(2)=Num(2)+1;
                    case 3
                        Num(3)=Num(3)+1;
                    case 4
                        Num(4)=Num(4)+1;
                end
            end
        end
    end
    [m,n]=max(Num);
    [p,q]=min(Num);
    if sum(Num==m)==1
        a_d=V(n,:)*(1-m/(((2*tau+1)*(2*tau+1)-1)/4)+1);
    elseif sum(Num==p)==1
        a_d=-V(q,:)*(1-m/(((2*tau+1)*(2*tau+1)-1)/4)+1);
    else
        a_d=[0 0];
    end
else
    a_d=[0 0];
end
% imshow(H)
% drawnow
end