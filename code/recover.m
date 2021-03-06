function  recoveredsignal  = recover(f_coefficient,orginalindex,N,sparsity)
% recover the original signal by deploying frequencies and ifft
recoveredsignal=zeros(1,N);
for n=1:N
for i=1:sparsity
    recoveredsignal(n)=recoveredsignal(n)+f_coefficient(i)...
        *exp(1i*2*pi*orginalindex(i)*(n-1)/N);
end
recoveredsignal(n)=recoveredsignal(n)/N;
end