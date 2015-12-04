function frequency_number = findingindex(circular_convolution,k)
f_index=1;
frequency_number=[0 0 0 0 0 0];
for w=1:k
    for i=1:2
    newsquence2(i)=circular_convolution(w,315*(i-1)+1);
    end
    for i=1:5
    newsquence5(i)=circular_convolution(w,126*(i-1)+1);
    end
    for i=1:7
    newsquence7(i)=circular_convolution(w,90*(i-1)+1);
    end
    for i=1:9
    newsquence9(i)=circular_convolution(w,70*(i-1)+1);
    end
    newsquenceF2=fft(newsquence2,2);
    newsquenceF5=fft(newsquence5,5);
    newsquenceF7=fft(newsquence7,7);
    newsquenceF9=fft(newsquence9,9);
    remainder=[0 0 0 0];
    for i=1:2
        if abs(newsquenceF2(i))>0.003
        remainder(1)=i-1;
        end
    end
    for i=1:5
        if abs(newsquenceF5(i))>0.003
        remainder(2)=i-1;
        end
    end
    for i=1:7
        if abs(newsquenceF7(i))>0.003
        remainder(3)=i-1;
        end
    end
    for i=1:9
        if abs(newsquenceF9(i))>0.003
        remainder(4)=i-1;
        end
    end
    if b*b'~=0
    frequency_number(f_index)=chinese(remainder);
    f_index=f_index+1;
    end
end