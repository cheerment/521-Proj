function x= sunzi_theorem(remainders, primes)
%remainders, primes: 1*N array?x: the solution

length_primes=length(primes);
for i=1:length_primes
    for j=i+1:length_primes
    if gcd(primes(i),primes(j))~=1;
        error('not prime to each other');
    end
    end
end
if numel(remainders) ~= numel(primes)
    error('number of elements between reminders and primes must agree');
end
%1.trivial case:
if numel(remainders) == 1
    x = remainders;
end
%2.reduce to the basic case:
while length(remainders) > 2
    [remainders, primes] = sz_reduce_th(remainders, primes);
end
%3.basic case:
x = basic_sz_th(remainders, primes);    