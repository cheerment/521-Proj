function [ F_index ] = recover( frequency_number,sigma,tao,N)
F_index=[0 0 0 0 0 0 0];
k=1;
N=630
while ((k*N+frequency_number-tao)/sigma)<N
    w = (k*N+frequency_number-tao)/sigma;
    if rem(w,1) == 0
        break;
    else
        k = k+1;
    end
end
end
