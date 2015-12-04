function [sigma,tou,permuted_signal] = permutation(x)

% the inverse mapping is multiply freq indices with the multiplicative
% inverse of sigma
%
% actually sigma satisfies gcd(sigma,N)=1, here N is an even number, thus
% sigma is shosen to be an odd number

N = length(x); %signal length

% generate an odd number between 0 and N-1
global tou
global sigma
sigma = 2*ceil(N/2*(rand(1))) - 1;
while mod(sigma,2)==0|mod(sigma,3)==0|mod(sigma,5)==0|mod(sigma,7)==0
sigma = 2*ceil(N/2*(rand(1))) - 1;
end
% do the permutation
permuted_signal = zeros(1,N);
tou = floor(N*rand(1));
for n = 1:N
    %permuted_signal(i) = x(mod(i*sigma,N)+1);
    permuted_signal(n) = x(mod(sigma*n,N)+1)*exp(j*2*pi*n*tou/N);
end