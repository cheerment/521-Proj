%% initializing
if 0
    N=630;
    sparsity=6;
    primes = [2 5 7 9];
    n=0:(N-1);
    [signal, freqs] = gen_sig(N,sparsity);
    signal = awgn(signal,80);
    Fsignal = fft(signal,N); 
    [sigma,tou,p_signal] = permutation(signal);
    k=105; % numbers of filters
    [fliter_bank,FILTER_BANK] = fliter(k,N,n); 
    circular_convolution = process(fliter_bank,p_signal,k,N); %sets of filtered signals
end
%% CRT
if 0
    [frequency_number,f_coefficient] = findingindex(circular_convolution,k,sparsity,primes,N);
    orgidx  = originalindex(frequency_number,sigma,tou,N);
    if 1
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
    f_coefficient = estcoeffi(orgidx,sam_num,N,sparsity,signal);
    % recover signal
    recoveredsignal  = recover(f_coefficient,orgidx,N,sparsity);
end
%% plot
if 0
    subplot(1,2,1);
    plot(n,abs(Fsignal))
    subplot(1,2,2);
    plot(n,abs((fft(recoveredsignal))))
end
%% influence of num of estimate points
if 1
    value = zeros(1,400);
    for num_est = 1:400
        iter = 20;
        VAR = zeros(1,sparsity);
        f_coefficient_all = zeros(1,sparsity,iter);
        for ii = 1:iter
            f_coefficient_all(:,:,ii) = estcoeffi(orgidx,num_est,N,sparsity,signal);
        end
        VAR = var(f_coefficient_all,1,3);
        value(num_est) = mean(VAR);
    end
    plot(1:400,value)
end