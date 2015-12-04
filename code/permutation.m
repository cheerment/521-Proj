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

% do the permutation
permuted_signal = zeros(1,N);
tou = floor(N*rand(1));
for n = 1:N
    %permuted_signal(i) = x(mod(i*sigma,N)+1);
    permuted_signal(n) = x(mod(sigma*n+tou,N)+1);
end
