function f_coefficient=coefficient(frequency_number,N,signal,sparsity)
f_coefficient=zeros(1,sparsity);
for s=1:sparsity
    for n=1:N
    f_coefficient(s)=f_coefficient(s)+signal(n)*exp(-j*2*pi*(frequency_number(s)-1)*(n-1)/N);
    end
end