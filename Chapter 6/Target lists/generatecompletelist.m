function [ret] = generatecompletelist(sch,a,b,c,d,e,f,ml,rlist)

ind = ml(:,1);
[x y] = size(ind);
indx(:,1) =  ismember(ind,a(:,1));
indx(:,2) =  ismember(ind,b(:,1));
indx(:,3) =  ismember(ind,c(:,1));
indx(:,4) =  ismember(ind,d(:,1));
indx(:,5) =  ismember(ind,e(:,1));
indx(:,6) =  ismember(ind,f(:,1));

ret = zeros(x,1);

for i  = 1:1:6
    for j = 1:1:x
        if ret(j,1)==0
            selectedlist = indx(:,rlist(i,sch));
            ret(j,1)= ml(j,1)*selectedlist(j,1);
        end
    end
end