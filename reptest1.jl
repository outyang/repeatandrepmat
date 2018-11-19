
using Random
using BenchmarkTools

a1=bitrand(25,2500);
a2=bitrand(2500,2500);

(clen,alen)=size(a1);
@btime for i=1:25
    A=repeat((@view a1[i,:])',outer = (clen-i+1,1));
end

(clen,alen)=size(a2);
@btime for i=1:25
    A=repeat((@view a2[i,:])',outer = (clen-i+1,1));
end
