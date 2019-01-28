function a=Fcn(position,q)
global N_in_ant N_num_ant N_in0
num=N_num_ant(q);
if num>10
    k=10;
else
    k=num;
end
if num>=1
    Me=zeros(k,3);
    for i=num:-1:num-k+1
        Me(num-i+1,1:2)=mean(N_in_ant(q,i).roadmat,1);
        Me(num-i+1,3)=norm(position-Me(num-i+1,1:2));
    end
    [~,b]=min(Me(:,3));
    M=N_in_ant(q,b).roadmat-N_in0(:,q)';
    K=1/sqrt(M(:,1).^2+M(:,2).^2);
    Bj=N_in_ant(q,b).roadmat-position;
    a=sum(K'.*Bj,1)/norm(sum(K'.*Bj,1));
else
    a=[0 0];
end
