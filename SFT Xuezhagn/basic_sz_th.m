function x = basic_sz_th(remainders, primes)
%:????????????????x by 3, reminder: 2?x by 5, reminder: 3?
%reminders, primes: 2*1 array which are intergets
%??????????
if (numel(remainders)~=2 || numel(primes) ~= 2) %numel???????????
    error('incorrect inputs');
end
if(gcd(primes(1), primes(2)) ~= 1)
    error('incorrect input argument --> primes');
end
%?????????
[chosen_prime, chosen_idx] = max(primes);%chose_idx??max?primes???primes???
chosen_remainder = remainders(chosen_idx);
[candidates_size, check_idx] = min(primes);
check_remainder = remainders(check_idx);
lambda_candidates = [0:candidates_size-1]*chosen_prime + chosen_remainder;
%lambda_candidates????chosen_prime????chosen_remainder?
%????lambda_candidates?????candidates_size?????check_remainder??
lambda_found = 0;%??
for i=1:candidates_size
    if rem(lambda_candidates(i),candidates_size) == check_remainder
        lambda_found = 1;
        break;
    end
end
if lambda_found == 1
    x =lambda_candidates(i);
else
    error('no solution');
end