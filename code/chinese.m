function x = chinese(reminders,primes)
M=1;
y=length(primes);
for i=1:y
    M=M*primes(i);
end
for i=1:y
    Mi(i)=M/primes(i);
end
T=zeros(1,y);
for i=1:y
    for t=1:M
        if mod(t*Mi(i),primes(i))==1
            T(i)=t;
            break
        end
    end
end
x=0;
for i=1:y
    x=x+reminders(i)*Mi(i)*T(i);
end
x=mod(x,M)+1;