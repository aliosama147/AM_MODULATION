while(1)
    clc
    clear
    close all

    disp("1-default values");
    disp("2-input your values");

    flag1 = input('Choose one from above : ');

    if(isempty(flag1) || flag1 == 1)

        Am = 5;
        Fm = 10;
        Ac = 10;
        Fc = 100;
        Fs = 1000;
        t = 0 : 0.001 : 1;
        Mt = Am*cos(2*pi*Fm.*t);
        Ct = Ac*cos(2*pi*Fc.*t);
        St = (Ac + Mt).*cos(2*pi*Fc.*t);

        subplot(231)
        plot(t,Mt);
        title('Modulating Signal')
        xlabel('Time')
        ylabel('Amplitude')

        subplot(232)
        Mf = fftshift(fft(Mt));
        F = -Fs/2 : Fs/2;
        plot(F,Mf);
        title('Modulating Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        subplot(233)
        plot(t,St);
        title('Modulated Signal in Time Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        subplot(234)
        Sf = fftshift(fft(St));
        plot(F,Sf);
        title('Modulated Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        Mt = St.*cos(2*pi*Fc.*t);
        [a,b] = butter(5,0.2);
        Mt = filter(a,b,Mt);

        subplot(235)
        plot(t,Mt);
        title('Demodulated Signal (Original Signal)')
        xlabel('Time')
        ylabel('Amplitude')
        % axis([0 0.1 -10 10])


        subplot(236)
        Mf = fftshift(fft(Mt));
        plot(F,Mf);
        title('Demodulated Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')
    elseif flag1 == 2
        Am = input('Enter the Amplitude of the modulating signal : ');
        Fm = input('Enter the Frequency of the modulating signal : ');
        Ac = input('Enter the Amplitude of the carrier signal : ');
        Fc = input('Enter the Frequency of the carrier signal : ');
        Fs = input('Enter the sampling time : ');
        ts = input('Enter the start time : ');
        tf1 = input('Enter the end time : ');
        t = ts : 1/Fs : tf1;
        Mt = Am*cos(2*pi*Fm.*t);
        Ct = Ac*cos(2*pi*Fc.*t);
        St = (Ac + Mt).*cos(2*pi*Fc.*t);

        subplot(231)
        plot(t,Mt);
        title('Modulating Signal')
        xlabel('Time')
        ylabel('Amplitude')

        subplot(232)
        Mf = fftshift(fft(Mt));
        F = -Fs/2 : Fs/2;
        plot(F,Mf);
        title('Modulating Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        subplot(233)
        plot(t,St);
        title('Modulated Signal in Time Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        subplot(234)
        Sf = fftshift(fft(St));
        plot(F,Sf);
        title('Modulated Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        Mt = St.*cos(2*pi*Fc.*t);
        [a,b] = butter(5,0.2);
        Mt = filter(a,b,Mt);

        subplot(235)
        plot(t,Mt);
        title('Demodulated Signal (Original Signal)')
        xlabel('Time')
        ylabel('Amplitude')
        % axis([0 0.1 -10 10])


        subplot(236)
        Mf = fftshift(fft(Mt));
        plot(F,Mf);
        title('Demodulated Signal in Frequency Domain')
        xlabel('Frequency')
        ylabel('Amplitude')

        else 
            disp("Please enter a valid choice ");

    end

        flag2 = input('press 0 to exit or 1 to continue : ');
        if isempty(flag2) || flag2 == 0
            break;
        end

end