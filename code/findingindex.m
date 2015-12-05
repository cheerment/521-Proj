function [frequency_number, coeffi] = findingindex(circular_convolution,k,sparsity,primes,N)
% domimant frequency indices of the permuted and filtered signals.
% and their corresponding coefficients.
% <0.1 will be take as noise.
f_index=1; % timer 
threshold = norm(sum(circular_convolution))^2/(N*1000); 
coeffi = zeros(1,sparsity);
frequency_number = zeros(1,sparsity);
for w=1:k % for each filtered signal
    if norm(circular_convolution(w,:))^2/N > threshold
        reminders = zeros(1,length(primes)); %reminders of each prime
        for l = 1:length(primes) % for each prime number
            sampledsig = downsample(circular_convolution(w,:),N/primes(l));
            SAMPLEDSIG = fft(sampledsig,primes(l));
    %         if mean(N*abs(SAMPLEDSIG)/primes(l)) > threshold %compensate for the 1/N in ifft
    %             for i=1:primes(l) % for every fre point in the spectrum
    %                 if abs(N*SAMPLEDSIG(i)/primes(l)) > 0.1 % should be the average energy of sig
    %                     reminders(l) = i-1;
    %                     co = SAMPLEDSIG(i)*N/primes(l); % whatch out the N and divisor
    %                 end
    %             end
                [val,y] = max(N*abs(SAMPLEDSIG)/primes(l));
                reminders(l) = y-1;
                co = SAMPLEDSIG(y)*N/primes(l);
    %         end
        end
        if reminders*reminders'~=0 && f_index<7
            frequency_number(f_index)=chinese(reminders,primes);
            coeffi(f_index) = co;
            f_index=f_index+1;
        end
    end
end
