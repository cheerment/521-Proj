function frequency_number = findingindex1(circular_convolution,k,N,sparsity)
% domimant frequency indices of the permuted and filtered signals
f_index=1;
i=randi([1 N]);
frequency_number = zeros(1,sparsity);
for w=1:k
    if abs(circular_convolution(w,:)) >= 0.0007
    x=circular_convolution(w,i+1)/circular_convolution(w,i);
    if real(x)>0
    frequency_number(f_index)=ceil(mod(atan(imag(x)/real(x))/2/pi*N,N));
    f_index=f_index+1;
    else
    frequency_number(f_index)=ceil(mod(atan(imag(x)/real(x))/2/pi*N+N/2,N));    
    f_index=f_index+1;
    end
    end
end