function  F_index  = originalindex( frequency_number,sigma,tou,N)
sparsity = length(frequency_number);
F_index=zeros(1,sparsity);
for t=1:N
    if mod(t*sigma,N)==1
        break
    end
end % t is the multiplative inverse of sigma
for i=1:sparsity    
    frequency_number(i)=mod(frequency_number(i)-1-tou,N);
end
for i=1:sparsity
    F_index(i)=rem(frequency_number(i)*t,N);
end