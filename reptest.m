a1=logical(randi(2,25,2500)-1);
a2=logical(randi(2,2500,2500)-1);

tic
[clen,~]=size(a1);
 for i=1:20
    A=repmat(a1(i,:),[clen-i+1,1]);
end
toc

tic
[clen,~]=size(a2);
for i=1:20
    A=repmat(a2(i,:),[clen-i+1,1]);
end
toc

tic
reptime(a1);
toc

tic
reptime(a2);
toc

function A=reptime(a)
    [clen,~]=size(a);
    for i=1:20
        A=repmat(a(i,:),[clen-i+1,1]);
    end
end
