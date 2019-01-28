function Stair(q)
global Num_stair Num_sq2 Num_sq1
global Pos_stair M_stair
global Peo_pos0 Num_per0 N_in0 N_in Pos_start0 V0 Stop_t0 Pos_save0
i=1;
[~,b]=size(N_in0);
while i<=Num_stair(q)
    Pos_stair(q).pos(i,:)=Pos_stair(q).pos(i,:)+[0 1];
    M_stair(q).M=circshift(M_stair(q).M,1);
    M_stair(q).M(:,1)=M_stair(q).M(:,1)*0;
    Num_sq2(q)=sum(sum(M_stair(q).M(:,1:5)));
    Num_sq1(q)=sum(sum(M_stair(q).M(:,17:21)));
    if Pos_stair(q).pos(i,2)>32
        Num_per0=Num_per0+1;
        Stop_t0(Num_per0)=0;
        Pos_save0(Num_per0).pos=[];
        Peo_pos0(Num_per0,:)=round(N_in(:,q)');
        Dist=100000;
        for j=1:1:b
            if norm([N_in(1,q) N_in(2,q) 4*N_in(1,q)]-[N_in0(:,j)' 4*N_in0(1,j)])<Dist
                Pos_final=round(N_in0(:,j));
                Dist=norm([N_in(1,q) N_in(2,q) 4*N_in(1,q)]-[N_in0(:,j)' 4*N_in0(1,j)]);
            end
        end
        Pos_start0(Num_per0,:)=Pos_final';
        V0(Num_per0,:)=[0 0];
        Pos_stair(q).pos(i,:)=[];
        Num_stair(q)=Num_stair(q)-1;
        i=i-1;
    end
    i=i+1;
end
end