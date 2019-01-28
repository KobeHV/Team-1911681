function M_ant_upd2(q,A)
global M_ant2
[num,~]=size(A);
for i=1:1:num
%     A(i,1)
%     A(i,2)
%     q
%     M_ant(q).M(A(i,1),A(i,2))
    M_ant2(q).M(A(i,1),A(i,2))=M_ant2(q).M(A(i,1),A(i,2))+1;
end
end