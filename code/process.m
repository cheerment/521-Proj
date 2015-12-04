function circular_convolution = process(fliter_time,signal,k,N)
% output: a set of single frequency signals after filter, 
% rows no. of signals, cols signal index.
linear_convolution=zeros(k,2*N);
circular_convolution=zeros(k,N);
for q=1:k
    linear_convolution(q,:)=[conv(fliter_time(q,:),signal) 0];
end

for q=1:k
    circular_convolution(q,:)=linear_convolution(q,1:N)+linear_convolution(q,(N+1):2*N);
end