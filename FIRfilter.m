%% S�tt upp en del parameterar

f = 5000;                   % Signalens frekvens
fs = 44100;                 % Sampelfrekvens
Ts = 1/fs;                  % Sampelintervall
k = 0:1:(0.01*fs);          % Diskret tidsvariabel �ver 0.01 sek
x = cos(2*pi*f*k*Ts);       % Signalen skapas

frek=0:22050;
h=[0.5 -0.5];
H=h(1)+h(2)*exp(i*2*pi*frek*Ts);
figure(11);subplot(2,1,1);plot(frek,abs(H));title('amplitudkarakteristik');
subplot(2,1,2);plot(frek,angle(H));title('faskarakteristik');

figure(12);
subplot(2,1,1);plot(x,'o-');title('insignal');
y=conv(x,h,'same');  % utsignal = faltning mellan insignal och impulssvar
subplot(2,1,2);plot(y,'o-');title('utsignal');

%% M�starprov: Kung-FIR

f = 19000;                   % Signalens frekvens
fs = 44100;                 % Sampelfrekvens
Ts = 1/fs;                  % Sampelintervall
k = 0:1:(0.01*fs);             % Diskret tidsvariabel �ver 0.01 sek
x = cos(2*pi*f*k*Ts);       % Signalen skapas

frek=0:22050;
h=[0.103 0 -0.0303 0 0.138 0 -0.2197 0 0.2821 0 -0.2197 0 0.1038 0 -0.0303];
figure(13);subplot(3,1,1);plot(h);title('filterkoefficienter');
%H=5;    % �NDRA H�R!
figure(13);subplot(3,1,2);plot(frek,abs(H));title('amplitudkarakteristik');
figure(13);subplot(3,1,3);plot(frek,angle(H));title('faskarakteristik');
figure(14);
subplot(2,1,1);plot(x,'o-');title('insignal');
y=conv(x,h,'same');  % utsignal = faltning mellan insignal och impulssvar
subplot(2,1,2);plot(y,'o-');title('utsignal');
hold('on');plot(x,'o-r');hold('off')

%% M�starprov: FIR-fu

f = 11050;                   % Signalens frekvens
fs = 44100;                 % Sampelfrekvens
Ts = 1/fs;                  % Sampelintervall
k = 0:1:(0.01*fs);             % Diskret tidsvariabel �ver 0.01 sek
x = cos(2*pi*f*k*Ts);       % Signalen skapas

frek=0:22050;
h=500; % VAd ska st� h�r?
figure(15);subplot(2,1,1);plot(h);title('filterkoefficienter');
H=h; % SAMMA H�R SOM OVAN!
figure(15);subplot(3,1,2);plot(frek,abs(H));title('amplitudkarakteristik');
figure(15);subplot(3,1,3);plot(frek,angle(H));title('faskarakteristik');
figure(16);
subplot(2,1,1);plot(x,'o-');title('insignal');
y=conv(s1,h,'same');  % utsignal = faltning mellan insignal och impulssvar
subplot(2,1,2);plot(y,'o-');title('utsignal');
hold('on');plot(x,'o-r');hold('off')


%%
