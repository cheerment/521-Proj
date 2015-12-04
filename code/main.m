N=630;
sparsity=6;
n=0:(N-1);
signal = gen_sig(N,sparsity);
Fsignal = fft(signal,N); % 
[sigma,tou,p_signal] = permutation(signal);
k=35; % numbers of filters
[fliter_bank,FILTER_BANK] = fliter(k,N,n);
circular_convolution = process(fliter_bank,p_signal,k,N);
[frequency_number,f_coefficient] = findingindex(circular_convolution,k);
% f_coefficient = abs(coefficient(frequency_number,N,signal,sparsity))
orgidx  = originalindex(frequency_number,sigma,tou,N);
recoveredsignal  = recover( f_coefficient,orgidx,N,sparsity);
% subplot(1,2,1);
% plot(n,abs(Fsignal))
% subplot(1,2,2);
% plot(n,abs((fft(recoveredsignal))))