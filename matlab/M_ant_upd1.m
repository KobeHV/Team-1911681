function M_ant_upd1(q,A)
global M_ant1
[num,~]=size(A);
for i=1:1:num
%     A(i,1)
%     A(i,2)
%     q
%     M_ant(q).M(A(i,1),A(i,2))
    M_ant1(q).M(A(i,1),A(i,2))=M_ant1(q).M(A(i,1),A(i,2))+1;
end
end