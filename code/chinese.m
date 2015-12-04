function [ x ] = chinese( b )
a=[2 5 7 9];
M=1;
y=length(a);
for i=1:y
    M=M*a(i);
end
for i=1:y
    Mi(i)=M/a(i);
end
T=zeros(1,y);
for i=1:y
    for t=1:M
        if mod(t*Mi(i),a(i))==1
            T(i)=t;
            break
        end
    end
end
x=0;
for i=1:y
    x=x+b(i)*Mi(i)*T(i);
end
x=mod(x,M)+1;