function a_info=Info_ant(q,position)
global M_ant1
M=M_ant1(q).M;
[a,b]=size(M);
a_info=[0 0];
tau=50;
if position(1)-tau>0 && position(2)-tau>0 && position(1)+tau<a && position(2)+tau<b
    A(1:2*tau,1)=position(1)+tau;
    A(1:2*tau,2)=(position(2)-tau):1:(position(2)+tau-1);
    
    B(1:2*tau,1)=(position(1)+tau):-1:(position(1)-tau+1);
    B(1:2*tau,2)=position(2)+tau;
    
    C(1:2*tau,1)=position(1)-tau;
    C(1:2*tau,2)=(position(2)+tau):-1:(position(2)-tau+1);
    
    D(1:2*tau,1)=(position(1)-tau):1:(position(1)+tau-1);
    D(1:2*tau,2)=position(2)-tau;
    
    H=round([A;B;C;D]);
    for i=1:1:8*tau
        if M(H(i,1),H(i,2))~=0
            a_info=a_info+M(H(i,1),H(i,2))*(H(i,:)-position)/norm(H(i,:)-position)/norm(H(i,:)-position);
        end
    end
    if norm(a_info)~=0
        a_info=a_info/norm(a_info);
    end
else
    a_info=[0 0];
end
end