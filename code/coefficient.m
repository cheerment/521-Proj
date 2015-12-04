function f_coefficient=coefficient(frequency_number,N,signal)
f_coefficient=[0 0 0 0 0 0];
for s=1:6
    for n=1:N+1
    f_coefficient(s)=f_coefficient(s)+signal(n)*exp(-j*2*pi*(frequency_number(s)-1)*(n-1)/(N+1));
    end
end
