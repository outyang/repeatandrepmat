
using Random
using BenchmarkTools

a1=bitrand(25,2500);
a2=bitrand(2500,2500);

(clen,alen)=size(a1);
ta=BitArray(zeros(1,alen));

@btime for i=1:20
    ta[1,:]=a1[i,:];
    A=repeat(ta,outer = [clen-i+1,1]);
end

(clen,alen)=size(a2);
ta=BitArray(zeros(1,alen));

@btime for i=1:20
    ta[1,:]=a2[i,:];
    A=repeat(ta,outer = [clen-i+1,1]);
end

function reptime(a)
    (clen,alen)=size(a);
    ta=BitArray(zeros(1,alen));
    A=similar(ta)
    for i=1:20
        ta[1,:]=a[i,:];
        A=repeat(ta,outer = [clen-i+1,1]);
    end
    return A
end

@btime reptime(a1);

@btime reptime(a2);
