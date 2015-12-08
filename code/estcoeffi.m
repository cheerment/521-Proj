function f_coefficient = estcoeffi(orgidx,sam_num,N,sparsity,signal)

random_idx = randi(N,[1 sam_num]);
estimate = signal(random_idx);
es = 0;
iter = 100;
f_coefficient = zeros(1,sparsity);
for ii = 1:iter
    W = exp(-1i*2*pi/N*(random_idx-1)'*orgidx);
    f_coefficient(1,:) = N*estimate*W/sam_num;
end
f_coefficient = mean(f_coefficient,3);