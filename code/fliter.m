function  [filter_time,filter_frequency] = fliter(k,N,n)
% preallocating for speed
filter_time = zeros(k,N);
filter_frequency = zeros(k,N);
% first filter.
filter_frequency(1,:)=[ones(1,N/k) zeros(1,N-N/k)];
filter_time(1,:)=ifft(filter_frequency(1,:),N);
% shifting the filter
for q=1:k
    filter_time(q,:)=filter_time(1,:)...
        .*exp(1i*2*pi/k*n*(q-1)); 
    filter_frequency(q,:)=fft(filter_time(q,:));
end