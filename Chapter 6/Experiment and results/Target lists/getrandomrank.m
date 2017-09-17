function [ret] = getrandomrank(inp)
[x y] = size(inp);
ret = randperm(x)';
