function  recoveredsignal  = recover( f_coefficient,orginalindex,N,sparsity)
recoveredsignal=zeros(1,N);
for n=1:N
for i=1:sparsity
    recoveredsignal(n)=recoveredsignal(n)+f_coefficient(i)*exp(j*2*pi*orginalindex(i)*(n-1)/N);
end
recoveredsignal(n)=recoveredsignal(n)/N;
end