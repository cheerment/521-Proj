function  F_index  = originalindex( frequency_number,sigma,tou,N)
F_index=[0 0 0 0 0 0];
k=1;
for t=1:630
    if mod(t*sigma,N)==1
        break
    end
end
for i=1:6    
    frequency_number(i)=mod(frequency_number(i)-1-tou,630);
end
for i=1:6
    F_index(i)=rem(frequency_number(i)*t,630);
end