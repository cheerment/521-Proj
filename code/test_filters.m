for i = 1:35
    F_p_signal(i,:) = fft(circular_convolution(i,:));
end
% plot(n,abs(F_p_signal(4,:)))
% abs(max(F_p_signal'))';
% n2 = downsample(circular_convolution(4,:),N/5);
% F12 = fft(eye(12))';
% invF12 = F12;
% X = [0 0 0 0 0 1 0 0 0 0 0 0];
% x = invF12*X';
% xd = downsample(x,3);
% F4 = fft(eye(4))';
% 1/4*F4'*xd

X = [0 0 0 0 0 1 0 0 0 0 0 0];
x = ifft(X);
xd = downsample(x,3);
fft(xd)