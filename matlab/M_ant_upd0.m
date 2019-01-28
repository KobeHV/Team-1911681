function M_ant_upd0(q,A)
global M_ant0
[num,~]=size(A);
for i=1:1:num
%     A(i,1)
%     A(i,2)
%     q
%     M_ant(q).M(A(i,1),A(i,2))
    M_ant0(q).M(A(i,1),A(i,2))=M_ant0(q).M(A(i,1),A(i,2))+1;
end
end