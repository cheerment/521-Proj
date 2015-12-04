N=630;
sparsity=6;
n=0:(N-1);
signal = gen_sig(N,sparsity);
Fsignal = fft(signal,N); % 
[sigma,tou,signal] = permutation(signal);
k=35;
[fliter_bank,FILTER_BANK] = fliter(k,N,n);
circular_convolution = process(fliter_bank,signal,k,N);
% subplot(1,2,1);
% plot(n,abs(Fsignal));
% subplot(1,2,2);
% plot(n,abs((fft(signal))));
frequency_number = findingindex(circular_convolution,k)
f_coefficient = abs(coefficient(frequency_number,N,signal,sparsity))
orginalindex  = originalindex( frequency_number,sigma,tou,N)
recoveredsignal  = recover( f_coefficient,orginalindex,N,sparsity)
subplot(1,2,1);
plot(n,abs(Fsignal));
subplot(1,2,2);
plot(n,abs((fft(signal))));