function [Mn,Nn,i,j]=Select(M,N,p)
[a,b]=size(M);
global S
for i=p:1:a
    for j=1:1:b
        if M(i,j)==0
            [Mn]=floodFill(M,i,j,0,1);
            Nn=[N mean(S,2)];
%             subplot(1,2,1)
%             imshow(M)
% %             subplot(1,2,2)
%             size(Mn)
%             imshow(Mn)
            return
        else
            Nn=N;
            Mn=M;
        end
    end
end
end