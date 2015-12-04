function sparse_signal = gen_sig(N,k)
% N: length of the signal
% k: sparsity of the signal
S=zeros(1,N);
S((N/2-k/2):(N/2-1+k/2)) = 1;
sparse_signal = ifft(S);