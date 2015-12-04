function frequency_number = findingindex(circular_convolution,k)
% domimant frequency indices of the permuted and filtered signals

f_index=1;
frequency_number=[0 0 0 0 0 0];
for w=1:k
    for i=1:2
    new2(i)=circular_convolution(w,315*(i-1)+1);
    end
    for i=1:5
    new5(i)=circular_convolution(w,126*(i-1)+1);
    end
    for i=1:7
    new7(i)=circular_convolution(w,90*(i-1)+1);
    end
    for i=1:9
    new9(i)=circular_convolution(w,70*(i-1)+1);
    end
    newF2=fft(new2,2);
    newF5=fft(new5,5);
    newF7=fft(new7,7);
    newF9=fft(new9,9);
    b=[0 0 0 0];
    for i=1:2
        if abs(newF2(i))>0.003
        b(1)=i-1;
        end
    end
    for i=1:5
        if abs(newF5(i))>0.003
        b(2)=i-1;
        end
    end
    for i=1:7
        if abs(newF7(i))>0.003
        b(3)=i-1;
        end
    end
    for i=1:9
        if abs(newF9(i))>0.003
        b(4)=i-1;
        end
    end
    if b*b'~=0
    frequency_number(f_index)=chinese(b);
    f_index=f_index+1;
    end
end