function [ret] = generatecompletelist(sch,a,b,c,d,e,f,ml,rlist)
ll = {};
ll{1}=a;
ll{2}=b;
ll{3}=c;
ll{4}=d;
ll{5}=e;
ll{6}=f;
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
            selectedlistind = indx(:,rlist(i,sch));
            movieid= ml(j,1)*selectedlistind(j,1);
            selectedlist = ll{rlist(i,sch)};
            if movieid ~=0
                loc=find(selectedlist(:,1)==movieid);
                ret(j,1)=selectedlist(loc,2);
            end
        end
    end
end