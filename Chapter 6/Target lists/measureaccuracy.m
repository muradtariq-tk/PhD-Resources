function ret = measureaccuracy(inp1,inp2)
[x y] = size(inp1);
limit = x *0.25;
tp = x;
cp = 0;
for i = 1:1:x
    if abs(inp1(i)-inp2(i))<limit
        cp=cp+1;
    end
end
ret = cp/tp;