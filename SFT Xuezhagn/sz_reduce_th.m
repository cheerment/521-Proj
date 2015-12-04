function [remainders, primes] = sz_reduce_th(remainders, primes)
%Affect: reduce a generally szt problem gradually to a basic szt
%0. check inputs:
if (numel(remainders) ~= numel(primes))
    error('the dimension of remainders and primes must agree.');
end
if (numel(remainders) <= 2)
    error('the input problem is already a trivial or basic szt problem');
end
%1.reduce the first 2 module equations into 1 module equation using
%'basic_szt':
reduced_remainder = basic_sz_th(remainders(1:2), primes(1:2));
reduced_prime = primes(1)*primes(2);
%2. reducing result:
remainders = [reduced_remainder, remainders(3:end)];
primes = [reduced_prime, primes(3:end)];
end

