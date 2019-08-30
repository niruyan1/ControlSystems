%% Lab 1
clc;
clear all;
close all;
freq=[1 2 3 4 5 6 7 8];
w=2*pi*freq;
peak_speed=[3.5555 3.3605 3.1218 2.8156 2.6056 2.3950 2.1960 2.0228];
G=peak_speed./2;

f2=2*pi:1:16*pi;
f2=log10(f2);
cutofamp=ones(length(f2))*2.3858;

x=log10(w);
y=20.*log10(G);
hold on;
plot(x,y);
plot(f2,cutofamp,'r');

fc=1.484448;
fcy=0:1:5;
plot(fc*ones(size(fcy)),fcy,'m');

xlabel('log10(w)');
ylabel('|G(jw)| (dB)');
title('Bode Plot');
legend('Bode Plot','-3dB','log10(wc)=1.484448');
grid;
axis([min(x) max(x) min(y) 5]);
%%
clc;
close all;
clear all;
load('vm.mat');
subplot(2,1,1);
plot(Vm(:,1),Vm(:,2));
title('Vm');
ylabel('Voltage(V)');
xlabel('Time(s)');
axis([min(Vm(:,1)) max(Vm(:,1)) 0 max(Vm(:,2))+0.5]);
grid;

load ('wl.mat');
subplot(2,1,2);
hold on;
plot(wl(:,1),wl(:,2),'.');

set(findall(gca, 'Type', 'Line'),'LineWidth',2);

t0=3.7510;
t0y=0:0.0001:0.6407;
plot(t0*ones(size(t0y)),t0y,'c--');


t1=3.7800;
t1y=0:0.0001:4.0419;
plot(t1*ones(size(t1y)),t1y,'m--');


t2=min(wl(:,1)):0.01:max(wl(:,1));
mean_min=ones(length(t2))*0.6503;
plot(t2,mean_min,'k--');

mean_peak=ones(length(t2))*6.4434;
plot(t2,mean_peak,'k--');




title('wl');
ylabel('w(Rad/s)');
xlabel('Time(s)');
legend('wl','to=3.7510','t1=3.7800','µ(max)=6.4434','µ(min)=0.6503');
axis([min(wl(:,1)) max(wl(:,1)) 0 max(wl(:,2))+0.5]);
grid;

%%
clc;
close all;
clear all;
load ('vmp4.mat');
load('wlp4.mat');

subplot(2,1,1);
plot(Vm(:,1),Vm(:,2));
title('Vm');
ylabel('Voltage(V)');
xlabel('Time(s)');
axis([min(Vm(:,1)) max(Vm(:,1)) 0 max(Vm(:,2))+0.5]);
grid;

subplot(2,1,2);
hold on;
plot(wl(:,1),wl(:,2),'b');
plot(wl(:,1),wl(:,3),'g');
title('wl');
ylabel('w(Rad/s)');
xlabel('Time(s)');
grid;

load ('wlk19.mat');
plot(wl(:,1),wl(:,3),'r');
legend('Actual Response','Model: K=1.53, ?=0.0254','Model: K=1.9, ?=0.0254');
axis([min(Vm(:,1)) max(Vm(:,1)) 0 5]);
tau_actual=0.17;
tau_model1=0.039;
