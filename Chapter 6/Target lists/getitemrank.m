function ret = getitemrank(list,ind)
ls = list{1};
rl = ls(ind);
data_sorted = sort(rl);
[~, rnk] = ismember(rl,data_sorted);
ret=rnk;