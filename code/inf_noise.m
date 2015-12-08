clc, clear all
% influence of noise
% SNR from 100 to 60
% compute the norm of signal - recoveredsignal
iter = 100;
% no = zeros(1,41,iter);
for snr = 60:100    
    results = zeros(1,iter);
    parfor ii = 1:iter
        % initializing
        if 1
            N=630;
            sparsity=6;
            primes = [2 5 7 9];
            n=0:(N-1);
            [signal, freqs] = gen_sig(N,sparsity);
            signal = awgn(signal,snr);
            Fsignal = fft(signal,N); 
            [sigma,tou,p_signal] = permutation(signal);
            k=105; % numbers of filters
            [fliter_bank,FILTER_BANK] = fliter(k,N,n); 
            circular_convolution = process(fliter_bank,p_signal,k,N); %sets of filtered signals
        end
        % CRT
        if 1
            [frequency_number,f_coefficient] = findingindex(circular_convolution,k,sparsity,primes,N);
            orgidx  = originalindex(frequency_number,sigma,tou,N);
            if 1
                % estimate coefficients in another way
                sam_num = 200;
                f_coefficient = estcoeffi(orgidx,sam_num,N,sparsity,signal);
            end
            recoveredsignal  = recover(f_coefficient,orgidx,N,sparsity);
        end
        results(1,ii) = norm(Fsignal - fft(recoveredsignal));
%         no(1,snr-59,ii) = norm(signal - recoveredsignal);
    end
    no{snr} = mean(results);
end
% no_mean = mean(no,3);
% plot(60:100,no_mean)
no = cell2mat(no);
plot(60:100,no)
    
