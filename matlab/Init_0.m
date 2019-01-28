function Pos_final=Init_0(N_in,pos_i,pos_j,N_old)
[~,b]=size(N_in);
Dist=100000;
Pos_final=[100000 100000];
for i=1:1:b
    if norm([pos_i pos_j 4*pos_i]-[N_in(:,i)' 4*N_in(1,i)])<Dist
        Pos_final=N_in(:,i);
        Dist=norm([pos_i pos_j]-N_in(:,i)');
    end
end
end   
