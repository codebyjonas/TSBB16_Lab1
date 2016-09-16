% script natural

%% S�tt upp en del parameterar

fs = 44100;                 % Sampelfrekvens

%% L�s in ljuden och spela upp

load Ljud
figure(3);
for p=1:10,
  subplot(10,1,p);plot(ljud{p});
  sound(ljud{p},fs);title(sprintf('ljud %d',p));
  pause(1);
end,

%% �ndra kvantisering

b=15;
r=1.0;  %Signalinterval -r...+r
figure(4);
for p=1:10,
  kv_ljud=liu_quantize(ljud{p},r,b,'bipolar');
  subplot(10,1,p);plot(kv_ljud);title(sprintf('ljud %d',p));
  sound(kv_ljud,fs);
  pause(1);
end,

%% Hur beror kvantiseringsbruset av b?

for b=1:16
  kv_ljud=liu_quantize(ljud{10},1.0,b,'bipolar');
  sigma(b)=norm(ljud{10}-kv_ljud); % norm av kvantiersingsbrus
end,
figure(5);subplot(2,1,1);plot(sigma);title('sigma')
subplot(2,1,2);plot(log(sigma));title('logaritm av sigma');

%% nedsampling och interpolation: n�rmsta granne interpolation

m=3;n=2^m;
rekfilt=[0 0 ones(1,n) 0 0]; % en rektangelfunktion vid n�rmsta-granne
figure(6);plot(rekfilt,'o-','Linewidth',2);
title('interpolationsfunktion');
signal=ljud{10};
nedsampl=zeros(1,length(signal));
k=1:n:length(signal);
nedsampl(k)=signal(k);    % Sampla ned med faktor n
rekon=conv(nedsampl,rekfilt,'same');
figure(7);plot(rekon,'o-');title(sprintf('ljud %d',p));
hold('on');plot(k,signal(k),'or');hold('off');
sound(rekon,fs);

%% nedsampling och interpolation: linj�r interpolation

m=3;n=2^m;
rekfilt=[0 0 (n-abs(-n:(n-1)))/n 0 0]; % en rektangelfunktion vid n�rmsta-granne
figure(6);plot(rekfilt,'o-','Linewidth',2);
title('interpolationsfunktion');
signal=ljud{10};
nedsampl=zeros(1,length(signal));
k=1:n:length(signal);
nedsampl(k)=signal(k);    % Sampla ned med faktor n
rekon=conv(nedsampl,rekfilt,'same');
figure(7);plot(rekon,'o-');title(sprintf('ljud %d',p));
hold('on');plot(k,signal(k),'or-');hold('off');
sound(rekon,fs);

%% Hur beror felet av m?

signal=ljud{10};
sigma=[];
for m=1:10,
  n=2^m;
  rekfilt=(n-abs(-n:(n-1)))/n;
  nedsampl=zeros(1,length(signal));
  nedsampl(1:n:end)=signal(1:n:end);
  rekon=conv(nedsampl,rekfilt,'same');
  sigma(m)=norm(signal-rekon);
end,
figure(8);subplot(2,1,1);plot(sigma,'o-');title('sigma');
subplot(2,1,2);plot(log(sigma),'o-');title('log sigma');

%% Lineariet

f = 1000;
omega = 2*pi*f;
fs = 44100;
Ts = 1/fs;
k = 0:1:(2*fs);
s1 = cos(omega*k*Ts);
figure(1);
plot(s1(1:200),'o-');

gamma=2.5;
x=-1:0.01:1;
distf=sign(x).*(abs(x).^gamma);
figure(9);plot(x,distf);
s=ljud{10};
s=s1;
dist_s=sign(s).*(abs(s).^gamma);
figure(10);plot(dist_s);
sound(s,fs);pause(3);sound(dist_s,fs);

%%
