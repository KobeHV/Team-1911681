clear
clc
tic

global Num_per0 Num_per1  Num_per2
global N_in_ant0 N_num_ant0 M_ant0 N_in_ant1 N_num_ant1 M_ant1 N_in_ant2 N_num_ant2 M_ant2
global N_in N_in0
global Num_stair Num_sq2 Num_sq1
global Pos_stair M_stair
global Peo_pos0 Peo_M0 Pos_start0 V0 Stop_t0 Pos_save0
dt=0.1;
t=0;
a=2;
Dr=zeros(774,1576);
% initialize
[M_road0, M_Cas0, Cas_in0, Cas_out0, Peo_M0, Peo_pos0, Num_per0]=Flo_0;
[M_road1, M_Cas1, Cas_in1, Cas_out1, Peo_M1, Peo_pos1, Num_per1]=Flo_1;
[M_road2, M_Cas2, Cas_in2, Cas_out2, Peo_M2, Peo_pos2, Num_per2]=Flo_2;
% creat
V0=zeros(Num_per0,2);
Pos_start0=zeros(Num_per0,2);
Pos_save0(Num_per0).pos=[];
Stop_t0=zeros(Num_per0,1);

V1=zeros(Num_per1,2);
Pos_start1=zeros(Num_per1,2);
Pos_save1(Num_per1).pos=[];
Stop_t1=zeros(Num_per1,1);

V2=zeros(Num_per2,2);
Pos_start2=zeros(Num_per2,2);
Pos_save2(Num_per2).pos=[];
Stop_t2=zeros(Num_per2,1);
% global cass in
N_in0=Color_full(Cas_in0);
N_in=Color_full(Cas_in1);
[~,q0]=size(N_in0);
[~,q]=size(N_in);

for i=1:1:q
Pos_stair(i).pos=[];
end
Num_stair(1:q)=0;

for i=1:1:q
M_stair(i).M=zeros(5,32);
end
Num_sq2(1:q)=0;
Num_sq1(1:q)=0;
% global save
for i=1:1:q0
    M_ant0(i).M=M_road0*0;
end
N_num_ant0(1:q0)=0;
N_in_ant0(q0,1).roadmat=[];

for i=1:1:q
    M_ant1(i).M=M_road0*0;
end
N_num_ant1(1:q)=0;
N_in_ant1(q,1).roadmat=[];

for i=1:1:q
    M_ant2(i).M=M_road0*0;
end
N_num_ant2(1:q)=0;
N_in_ant2(q,1).roadmat=[];
% poeple position initialize
for i=1:1:Num_per0
    pos_i=Peo_pos0(i,1);
    pos_j=Peo_pos0(i,2);
    Pos_start0(i,:)=Init_0(N_in0,pos_i,pos_j,Pos_start0(i,:));
end
for i=1:1:Num_per1
    pos_i=Peo_pos1(i,1);
    pos_j=Peo_pos1(i,2);
    Pos_start1(i,:)=Init_0(N_in,pos_i,pos_j,Pos_start1(i,:));
end
for i=1:1:Num_per2
    pos_i=Peo_pos2(i,1);
    pos_j=Peo_pos2(i,2);
    Pos_start2(i,:)=Init_0(N_in,pos_i,pos_j,Pos_start2(i,:));
end
% people M
Peo_M0n=Peo_M0;
Peo_M1n=Peo_M1;
Peo_M2n=Peo_M2;
% calculate
for i=1:1:3000

    M_0=M_road0-Peo_M0n;
    M_1=M_road1-Peo_M1n;
    M_2=M_road2-Peo_M2n;
    [Peo_pos0, Peo_M0n, Pos_start0]=Choice_V0(M_0,Pos_start0,Peo_pos0,N_in0);
    [Peo_pos1, Pos_save1, V1, Stop_t1, Peo_M1n, Pos_start1]=Choice_V1(M_1,Pos_start1,Peo_pos1,Pos_save1,V1,Stop_t1,N_in);
    [Peo_pos2, Pos_save2, V2, Stop_t2, Peo_M2n, Pos_start2]=Choice_V2(M_2,Pos_start2,Peo_pos2,Pos_save2,V2,Stop_t2,N_in);
    
    for j=1:1:19
        M_ant0(j).M=0.99*M_ant0(j).M;
    end
    for j=1:1:19
        M_ant0(j).M=0.99*M_ant0(j).M;
    end
    for j=1:1:19
        M_ant0(j).M=0.99*M_ant0(j).M;
    end
    for j=1:1:q
        Stair(j);
    end
    [i Num_per0 Num_per1 Num_per2]
%     imshow(M_stair(1).M)
%     hold on
%     plot(N_in0(2,:),N_in0(1,:),'b*','markersize',60);
%     hold on
%     plot(Peo_pos0(:,2),Peo_pos0(:,1),'b.');
%     hold off
%     drawnow
end
% Draw_out(N_in0',Pos_start0,Peo_pos0,Num_per0);
