function w= mod11(y,sigma,tao,N)
% y = 1205;
% tao = 1060;
% sigma = 125;
% 
% N = 1287;

k=1;
while ((k*N+y-tao)/sigma)<N
    w = (k*N+y-tao)/sigma;
    if rem(w,1) == 0 
        break;
    else
        k = k+1; %if w is a decimal
    end
end
end

