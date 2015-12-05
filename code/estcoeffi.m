function f_coefficient = estcoeffi(orgidx,sam_num,N,sparsity,signal)

random_idx = randi(N,[1 sam_num]);
estimate = signal(random_idx);
es = 0;
f_coefficient = zeros(1,sparsity);
% for l = 1:sparsity
%     for i = 1:sam_num
%         es = es + estimate(i)*exp(-1i*2*pi/N*(random_idx(i)-1)*orgidx(l));
%     end
%     f_coefficient(l) = es*N/sam_num;
%     es = 0;
% end
W = exp(-1i*2*pi/N*(random_idx-1)'*orgidx);
f_coefficient = N*estimate*W/sam_num;

  