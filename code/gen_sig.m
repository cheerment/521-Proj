function [sparse_signal, freqs_real] = gen_sig(N,k)
% N: length of the signal
% k: sparsity of the signal
freqs = randi([300 400],[1 k]);
freqs_co = rand(1,k);
freqs_co(find(~(freqs_co>0.1))) = freqs_co(find(~(freqs_co>0.1))) + 0.1;
S=zeros(1,N);
S(freqs) = freqs_co;
% S((N/2-k/2):(N/2-1+k/2)) = 1;
sparse_signal = ifft(S);
freqs_real = freqs - 1;