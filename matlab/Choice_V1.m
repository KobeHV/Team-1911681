function [Peo_pos0_n, Pos_save0, V0_n, Stop_tn, Peo_M0n, Pos_start0n]=Choice_V1(M_0,Pos_start0,Peo_pos0,Pos_save0,V0,Stop_t,N_in0)
global Num_per1 N_in_ant1 N_num_ant1 Num_stair Num_sq1 Pos_stair M_stair
Pos_start0n=Pos_start0;
Peo_M0n=M_0*0;
dt=0.1;
Peo_pos0_n=Peo_pos0;
V0_n=V0;
Stop_tn=Stop_t;
i=1;
while i<=Num_per1
S=zeros(1,8);
[~,q]=min(sum(abs(Pos_start0(i,:)'-N_in0),1));
% a_ant=Fcn(Peo_pos0(i,:),q);
a_d=Density(M_0,Peo_pos0(i,:));
a_info=Info_ant(q,Peo_pos0(i,:));
a_dir=(Pos_start0(i,:)-Peo_pos0(i,:))/norm((Pos_start0(i,:)-Peo_pos0(i,:)));
a=a_dir+a_d+a_info;
V0_n(i,:)=V0(i,:)+a*dt;
if norm(V0_n(i,:))>4
    V0_n(i,:)=V0_n(i,:)/norm(V0_n(i,:))*4;
end
dist=V0_n(i,:)*(dt+Stop_t(i));
Vs=[1 0
    sqrt(2)/2 sqrt(2)/2
    0 1
    -sqrt(2)/2 sqrt(2)/2
    -1 0
    -sqrt(2)/2 -sqrt(2)/2
    0 -1
    sqrt(2)/2 -sqrt(2)/2];
Vb=[2 0
    2 1
    2 2
    1 2
    0 2
    -1 2
    -2 2
    -2 1
    -2 0
    -2 -1
    -2 -2
    -1 -2
    0 -2
    1 -2
    2 -2
    2 -1];
if norm(dist)<0.8
    for j=1:1:8
        S(j)=Vs(j,:)*dist'/norm(dist);
    end
    S=[S;1:8];
    S=sortrows(S',1);
    Sa=S(8:-1:1,2);
else
    for j=1:1:16
        S(j)=Vb(j,:)/norm(Vb(j,:))*dist'/norm(dist);
    end
    S=[S;1:16];
    S=sortrows(S',1);
    Sa=S(16:-1:1,2);
end
for j=1:1:9
    if j<9
        [Peo_pos0_n(i,:), niu]=Choice_point(Peo_pos0(i,:),Sa(j),dist);
    else
        Peo_pos0_n(i,:)=Peo_pos0(i,:);
        niu=0;
    end
    p2=2*(Peo_pos0_n(i,:)-Peo_pos0(i,:))+Peo_pos0(i,:);
    p3=3*(Peo_pos0_n(i,:)-Peo_pos0(i,:))+Peo_pos0(i,:);
    p4=4*(Peo_pos0_n(i,:)-Peo_pos0(i,:))+Peo_pos0(i,:);
    if M_0(Peo_pos0_n(i,1),Peo_pos0_n(i,2))==1 && M_0(p2(1),p2(2))==1 ...
        && M_0(p3(1),p3(2))==1 && M_0(p4(1),p4(2))==1
        if niu==0
            Stop_tn(i)=Stop_t(i)+dt;
        else
            Stop_tn(i)=0;
        end
        Peo_M0n(Peo_pos0_n(i,1),Peo_pos0_n(i,2))=1;
        break;
    end
end

Pos_save0(i).pos=[Peo_pos0(i,:);Pos_save0(i).pos];
W=N_in0'-Peo_pos0_n(i,:);
[p,~]=min(sqrt(W(:,1).^2+W(:,2).^2));
if p<50  && Num_sq1(q)<25
    Peo_M0n(Peo_pos0_n(i,1),Peo_pos0_n(i,2))=0;
    N_num_ant1(q)=N_num_ant1(q)+1;
    A=Pos_save0(i).pos;
    N_in_ant1(q,N_num_ant1(q)).roadmat=A;
    M_ant_upd1(q,A)
    
    Num_sq1(q)=Num_sq1(q)+1;
    Num_stair(q)=Num_stair(q)+1;
    lambda=0;
    for x=1:1:5
        for y=1:1:5
            M=M_stair(q).M;
            if M(x,y+16)==0 && lambda==0
                M_stair(q).M(x,y+16)=1;
                Pos_stair(q).pos(Num_stair(q),:)=[x y+16];
                lambda=1;
            end
        end
    end
    
    Peo_pos0_n(i,:)=[];
    Pos_start0n(i,:)=[];
    Pos_save0(i)=[];
    V0_n(i,:)=[];
    Stop_tn(i)=[];
    
    Pos_start0(i,:)=[];
    Peo_pos0(i,:)=[];
    V0(i,:)=[];
    Stop_t(i)=[];
    Num_per1=Num_per1-1;
    i=i-1;
end
i=i+1;
end
end