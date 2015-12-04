function  [fliter_time,fliter_frequency] = fliter(k,N,n)
fliter_frequency(1,:)=[ones(1,(N+1)/k),zeros(1,(N+1)*(k-1)/k)];
fliter_time(1,:)=ifft(fliter_frequency(1,:),N+1);
for q=1:k
    fliter_time(q,:)=fliter_time(1,:).*exp(j*2*pi/k*n*(q-1));
    fliter_frequency(q,:)=fft(fliter_time(q,:));
end