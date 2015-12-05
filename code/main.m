%% initializing
if 1
    N=630;
    sparsity=6;
    primes = [2 5 7 9];
    n=0:(N-1);
    [signal, freqs] = gen_sig(N,sparsity);
%     signal = awgn(signal,80);
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
    recoveredsignal  = recover(f_coefficient,orgidx,N,sparsity);
    % unbiased estimater for coefficients
    es_a = zeros(1,1000);
    es_sam_num = 400;
    for ii = 1:1000
        random_idx = randi(630,[1 es_sam_num]);
        estimate = signal(random_idx);
        es = 0;
        for i = 1:es_sam_num
            es = es + estimate(i)*exp(-1i*2*pi/N*(random_idx(i)-1)*311);
        end
        % abs(630*es/18)
        es_a(ii) = N*es/es_sam_num;
    end
    % 630*abs(es_a/1000)/es_sam_num
    var(es_a);
end
%% Phase Encoding
if 1
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
subplot(1,2,1);
plot(n,abs(Fsignal))
subplot(1,2,2);
plot(n,abs((fft(recoveredsignal))))