% script stat

clear all;close all

%% Sätt upp en del parameterar

f = 1000;
omega = 2*pi*f;
fs = 44100;
Ts = 1/fs;
k = 0:1:(2*fs);
s1 = cos(omega*k*Ts);
figure(1);
plot(s1(1:200),'o-');

%% Spela upp signalen s1

sound(s1,fs);

%% Skapa en andra signal och spela upp både gamla och nya signalen med en liten paus mellan

s2=sin(omega*k*Ts);
figure(1);subplot(2,1,1);plot(s1(1:200),'o-');title('s1')
subplot(2,1,2);plot(s2(1:200),'o-');title('s2')
sound(s1,fs);pause(3);sound(s2,fs);

%% Skapa en tredje signal och spela upp

s3=cos(2*omega*k*Ts);
figure(1);subplot(2,1,1);plot(s1(1:200),'o-');title('s1')
subplot(2,1,2);plot(s3(1:200),'o-');title('s3')
sound(s1,fs);pause(3);sound(s3,fs);

%% Två nya signaler

s4=s1+s3;
s5=s2+s3;
figure(1);subplot(2,1,1);plot(s4(1:200),'o-');title('s4')
subplot(2,1,2);plot(s5(1:200),'o-');title('s5')
sound(s4,fs);pause(3);sound(s5,fs);

%% Rita upp och spela upp ännu en variant

s6=0.5*s1+1.5*s3;
figure(1);subplot(2,1,1);plot(s4(1:200),'o-');title('s4')
subplot(2,1,2);plot(s6(1:200),'o-');title('s6')
sound(s4,fs);pause(3);sound(s6,fs);

%% Undersökning av vikningsdistortion

fs2=10000;
Ts2=1/fs2;
k=0:1:(2*fs2);
for frek=1000:1000:10000,
  signal=cos(2*pi*frek*k*Ts2);
  figure(2);plot(signal(1:200),'o-');
  title(sprintf('Signalens frekvens = %d Hz', frek));
  sound(signal,fs2); % ENTER på tangentborder för att fortsätta!
  pause;
end,
