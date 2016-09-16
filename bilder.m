% script bilder.m

%% M�starprov: Kvantisering av gr�skalebild

im=double(imread('cameraman.png'));
%im=double(imread('Park2.jpg'));
figure(11);colormap(gray);
imagesc(im);title('originalbild');

b=5;
imq=liu_quantize(im,256,b,'unipolar');
figure(12);colormap(gray);
imagesc(imq);title('kvantiserad bild');

%% M�starprov: Nedsampling

im=double(imread('JavaBW.jpg'));
figure(11);colormap(gray);
imagesc(im);title('originalbild');
n = 2^3;
ims = im(1:n:end,1:n:end);
figure(12);colormap(gray);
imagesc(ims);title('nedsamplad bild');

%%
