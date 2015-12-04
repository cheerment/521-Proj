function circular_convolution = process(fliter_time,signal,k,N)
linear_convolution=zeros(k,2*N+2);
circular_convolution=zeros(k,N+1);
for q=1:k
    linear_convolution(q,:)=[conv(fliter_time(q,:),signal) 0];
end

for q=1:k
    circular_convolution(q,:)=linear_convolution(q,1:N+1)+linear_convolution(q,N+2:2*N+2);
end