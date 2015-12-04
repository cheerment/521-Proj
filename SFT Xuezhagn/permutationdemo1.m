
save myfile coeffi;
clear all
load myfile
close all;


%for shaoye=1:10
    %Generate a sin signal
    iterationloop=10;
    M=2;
    K=3*M;
    change=8;
    Fs =101*103*105*change;                    % Sampling frequency
    T = 1/Fs;                     % Sample time
    N = 101*103*3*change;                      % Length of signal
    N1= 101*103*105*change;
    t = (0:N1-1)*T;                % Time vector
    % Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
    %x = sin(2*pi*200*t)+ sin(2*pi*10*t);
    %zhang=zeros(1,N1-N);
    thresh=50;
    SNR=60;
    x1=90*exp(1i*2*pi*2500*t)+90*exp(1i*2*pi*77*t)+...
        90*exp(1i*2*pi*35000*t)+90*exp(1i*2*pi*33000*t)...
        +90*exp(1i*2*pi*11450*t)+90*exp(1i*2*pi*11668*t);   %1*rand(1);
    %x=[x,zhang];
    %x1= awgn(x1,SNR) ;
    x=downsample(x1,35);
    exfre=zeros(N,1);
    excoefficent=zeros(N,10);

    tt=1;
    primes=zeros(4,1);
    xixi=[change 3 101 103];% 2 3 35 101 103


    fftt1=clock;
    fftresult=fft(x1,N1);
    fftt2=clock;
    FFTtime=etime(fftt2,fftt1);
    % 
    %     filterout = filter(coeffi,1,x);
    %     %w = linspace(-N/2, N/2, N);
    %     figure
    %     filterout=fft(x);
    %     %filterout=fftshift(filterout);
    %     plot(abs(filterout));


        for tt=1:K
            for i=1:size(coeffi,2)
                yk(tt,i)=coeffi(i)*exp(-1i*2*pi*i*tt/K);
            end
        end    

    %    %filterout = lowpassel(x);
    %     w = linspace(-N/2, N/2, N);
    %     figure
    %     filterout=fft(yk(5,:));
    %     %filterout=fft(x);
    %     %filterout=fftshift(filterout);
    %     plot(abs(filterout));



    %         figure
    %     filterout=fft(x,7);
    %     %filterout=fftshift(filterout);
    %     plot(abs(filterout));


    t1=clock;
     for xx=1:iterationloop
        index=zeros(3,2);
        i=0;
        N11=N;
            sigma=2*ceil(N11/2*(rand(1)))-1;             %Random generating a odd number between 0 and L-1 
            while(gcd(sigma,N)~=1)
               sigma=2*ceil(N11/2*(rand(1)))-1;
            end

            %tao=ceil(N*(rand(1)));               %b



           t3=clock;
           %Permutation
            for n=1:N
                %y(n)=exp((2*pi*1i*mod(tao*n,N)/N)*x(mod(n*sigma,N)));
                y(n)=x(mod((n*sigma),N)+1);%*exp((2*pi*1i*mod(tao*n,N)/N));
                %y(n)=6;
            end
            t4=clock;
            pertime(xx)=etime(t4,t3);

    %        t3=clock;
    %        %Permutation
    %        xxxx=zeros(N,1); 
    %        aaaa=1;
    %        for n=1:N
    %             if(sigma*n>aaaa*N)
    %                 aaaa=aaaa+1;
    %             end
    %             xxxx(sigma*n-(aaaa-1)*N)=x(n);
    %        end
    %        y=xxxx;

               %w = linspace(-N/2, N/2, N); 
    %     figure 
    %     filterout=fft(y);
        %filterout=fftshift(filterout); 
    %    plot(abs(filterout));

                %y(n)=exp((2*pi*1i*mod(tao*n,N)/N)*x(mod(n*sigma,N)));
                %y(n)=x(mod((n*sigma),N)+1);%*exp((2*pi*1i*mod(tao*n,N)/N));
    %         t4=clock;
    %         pertime=etime(t4,t3)


    %     %w = linspace(-N/2, N/2, N); 
    %     figure 
    %     filterout=fft(y);
    %     %filterout=fftshift(filterout); 
    %     plot(abs(filterout));

    %         w = linspace(-N/2, N/2, N);
    %         figure
    %         xhat=fft(y);
    %         xhatm=abs(xhat);
    %         plot(w,abs(xhat));
    %         plot(xhatm);

        %Filter-bank 

        for ee=1:K
            %ftime=clock;
            ykn1=conv(yk(ee,:),y);
            %ykn(ee,:)=filter(yk(ee,:),1,y);
            %ykn1=ykn(ee,:);
            %fotime=clock;
            %overalltime=etime(fotime,ftime)


        %   Find the index of the dominant frequency
         %    xixi=[2 7 11 13];
            %xixi=[2 3 4];
            for i=1:size(xixi,2)
                for ii=1:xixi(i)
                    a(ii)=ykn1((ii-1)*round(N/xixi(i))+1);
                end
                ahat=abs(fft(a,xixi(i)));
    %            ppppp(tt)=ahat;
                tt=tt+1;
    %             if(max(ahat)*13/xixi(i)>thresh)
    %              figure
    %              plot(ahat)

                index(i,:)=[mod(find(ahat==max(ahat))-1,xixi(i)),xixi(i)];
                coefficient=max(ahat)/xixi(i);
                xixi2=0;
                if(max(ahat)*20/xixi(i)<thresh)
                    xixi2=1;
                    break;
                end
            end

            if(xixi2==1)
                continue;
            end

            remainders=index(:,1)';
            primes=xixi;
            indexcrt(xx)= sunzi_theorem(remainders,primes);
            %indexcrt(xx)=round(indexcrt/2002*2002);
    %         disp('--------the result ---------------');
    %         fprintf('indexcrt=%d\n',indexcrt(xx)) 
    %         disp('--------the dominanet frequency ---------------'); 
            %mod(666*sigma,N)
            exfre1=round(mod11(indexcrt(xx),sigma,0,N));
            exfre(exfre1)=exfre(exfre1)+1; %voting
            excoefficent(exfre1,exfre(exfre1))=coefficient;
        end   
     end
    t2=clock;
    SFTtime=etime(t2,t1);


 %   
    
    [B,I]=sort(exfre,'descend');
    finalcoeffi=zeros(N,1);
    ficoe=max(excoefficent')';
    for pig=1:K
        finalcoeffi(I(pig))=ficoe(I(pig));
    end
    figure
    subplot(2,1,1);
    plot(finalcoeffi,'-');
    title('The Spectrm of SFT');
        xlabel('DFT point');
        ylabel('Magnitude');

    fftresult=abs(fftresult);
    subplot(2,1,2)
    plot(fftresult/N,'-');
    title('The Spectrm of FFT');
        xlabel('DFT point');
        ylabel('Magnitude');
    
    
%end
mean(FFTtime);
mean(SFTtime);
