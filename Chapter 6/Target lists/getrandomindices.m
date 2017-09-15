function ret = getrandomindices(completelist,samples)
c  = completelist{1};
[xx yy] = size(find(c~=0));
rows = randperm(xx);
rr=rows(1:samples)';
ret = rr;
