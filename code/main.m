%% initializing
if 1
    N=630;
    sparsity=6;
    primes = [2 5 7 9];
    n=0:(N-1);
    [signal, freqs] = gen_sig(N,sparsity);
    signal = awgn(signal,60);
    Fsignal = fft(signal,N); 
    [sigma,tou,p_signal] = permutation(signal);
    k=35; % numbers of filters
    [fliter_bank,FILTER_BANK] = fliter(k,N,n); 
    % binning
    circular_convolution = process(fliter_bank,p_signal,k,N); %sets of filtered signals
end
%% CRT
if 1
    % single frequency recovery
    [frequency_number,f_coefficient] = findingindex(circular_convolution,k,sparsity,primes,N);
    % mapping back to the original indices
    orgidx  = originalindex(frequency_number,sigma,tou,N);
    if 0
        % estimate coefficients in another way
        sam_num = 200;
        f_coefficient = estcoeffi(orgidx,sam_num,N,sparsity,signal);
    end
    recoveredsignal  = recover(f_coefficient,orgidx,N,sparsity);
end
%% Phase Encoding
if 0
    % find permuted spectrum indices
    frequency_number = findingindex1(circular_convolution,k,N,sparsity);
    % map back the the original indices
    orgidx  = originalindex(frequency_number,sigma,tou,N);
    % estimate coefficients
    sam_num = 20;
    iter = 20;
    f_coefficient(1,:,ii) = estcoeffi(orgidx,sam_num,N,sparsity,signal);
    % recover signal
    recoveredsignal  = recover(f_coefficient,orgidx,N,sparsity);
end
%% plot
if 1
    subplot(2,1,1);
    plot(n,abs(Fsignal))
    title('FFT result')
    xlabel('frequency /\omega')
    ylabel('coefficient')
    subplot(2,1,2);
    plot(n,abs((fft(recoveredsignal))))
    title('SFT result')
    xlabel('frequency /\omega')
    ylabel('coefficient')
end
%% influence of num of estimate points
if 0
    value = zeros(1,200);
    for num_est = 1:200
        iter = 20;
        VAR = zeros(1,sparsity);
        f_coefficient_all = zeros(1,sparsity,iter);
        for ii = 1:iter
            f_coefficient_all(:,:,ii) = estcoeffi(orgidx,num_est,N,sparsity,signal);
        end
        VAR = var(f_coefficient_all,1,3);
        value(num_est) = mean(VAR);
    end
    plot(1:200,value)
end
%% permutation plot
if 0
    subplot(2,1,1)
    plot(n,abs(Fsignal))
    title('spectrum of original signal')
    xlabel('samples')
    ylabel('magnitude')
    subplot(2,1,2)
    plot(n,abs(fft(p_signal)))
    title('spectrum of permutated signal')
    xlabel('samples')
    ylabel('magnitude')
end