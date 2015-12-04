N=630;
sparsity=6;
n=0:(N-1);
signal=gen_sig(N+1,sparsity);
Fsignal=fft(signal,N+1); % 
[sigma,tou,signal] = permutation(signal);
k=35;
fliter_time=zeros(k,1+N);
fliter_frequency=zeros(k,1+N);
[fliter_time,fliter_frequency]=fliter(k,N,n);
circular_convolution=process(fliter_time,signal,k,N);
subplot(1,2,1);
plot(n,abs(Fsignal));
subplot(1,2,2);
plot(n,abs((fft(signal))));
frequency_number=findingindex(circular_convolution,k)
f_coefficient=abs(coefficient(frequency_number,N,signal))
