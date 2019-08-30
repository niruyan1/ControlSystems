%% Simulation
clc;
close all;
clear all;

%Voltage
load('vm1.mat');
%subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -10 10]);
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
grid;

%position
load('pos1.mat');
%subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,3));
hold on;
plot(data_pos(:,1),data_pos(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -0.7 0.7]);

%max peak
ymax=max(data_pos(:,3));
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'b --');

%ro
r0time=1.75;
r0=-0.3927:0.00001:0.3927;
plot(r0time*ones(size(r0)),r0,'k --');

%initial time
initial_time=1.248;
itime_y=-1:1:5;
plot(initial_time*ones(size(itime_y)),itime_y,'c --');

%peak time
peak_time=1.450;
ptime_y=-1:1:5;
plot(peak_time*ones(size(ptime_y)),ptime_y,'m --');

title('Theta L');
xlabel('Time(s)');
ylabel('Theta(Rad)');
legend('Simulated','Setpoint','ymax=0.8252','R0=0.7854','t0=1.248','tmax=1.450');
legend('Simulated','Setpoint');
grid;
%% Simulation FIlter
clc;
close all;
clear all;

%Voltage
load('vm2.mat');
%subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -10 10]);
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
grid;

%position
load('pos2.mat');
%subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,3));
hold on;
plot(data_pos(:,1),data_pos(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -0.7 0.7]);

%max peak
ymax=max(data_pos(:,3));
max_line=18:1:30;
plot(max_line,ymax*ones(size(max_line)),'b --');

%ro
r0time=21.75;
r0=-0.3927:0.00001:0.3927;
plot(r0time*ones(size(r0)),r0,'k --');

%initial time
initial_time=21.248;
itime_y=-1:1:5;
plot(initial_time*ones(size(itime_y)),itime_y,'c --');

%peak time
peak_time=21.450;
ptime_y=-1:1:5;
plot(peak_time*ones(size(ptime_y)),ptime_y,'m --');

title('Theta L');
xlabel('Time(s)');
ylabel('Theta(Rad)');
%legend('Simulated','Setpoint','ymax=0.8305','R0=0.7854','t0=21.248','tmax=21.450');
legend('Simulated','Setpoint');
grid;
%% Experimental
clc;
close all;
clear all;

%Voltage
load('vm3.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -10 10]);
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
grid;

%position
load('pos3.mat');
subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,3));
hold on;
plot(data_pos(:,1),data_pos(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -0.7 0.7]);

%max peak
ymax=max(data_pos(:,3));
max_line=10:1:15;
plot(max_line,ymax*ones(size(max_line)),'b --');

%ro
r0time=11.75;
r0=-0.3958:0.00001:0.3973;
plot(r0time*ones(size(r0)),r0,'k --');

%initial time
initial_time=11.2490;
itime_y=-1:1:5;
plot(initial_time*ones(size(itime_y)),itime_y,'c --');

%peak time
peak_time=11.4230;
ptime_y=-1:1:5;
plot(peak_time*ones(size(ptime_y)),ptime_y,'m --');

title('Theta L');
xlabel('Time(s)');
ylabel('Theta(Rad)');
legend('Measured','Setpoint','ymax=0.9035','R0=0.7931','t0=11.2490','tmax=11.4230');
grid;

%%
clc;
close all;
clear all;

%Voltage
load('vm3.mat');

load('pos3.mat');
plot(data_pos(:,1),data_pos(:,3));
hold on;
plot(data_pos(:,1),data_pos(:,2));
axis([min(data_vm(:,1))+0.25 min(data_vm(:,1))+4.25 -0.7 0.7]);

title('Theta L');
xlabel('Time(s)');
ylabel('Theta(Rad)');
legend('Measured ss = 0.3973','Setpoint ss = 0.3927');
grid;
%% diff between inputs
clc;
close all;
clear all;

%Voltage
load('vm2.mat');
data_vm(:,1)=data_vm(:,1)-20.75;
sim_voltage=data_vm(:,2);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([0 3.5 -7 7]);
grid;

hold on;

%Voltage 1
load('vm3.mat');
data_vm(:,1)=data_vm(:,1)-10.75;
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
grid;
axis([0 3.5 -7 7]);
legend('Voltage Input in Simulations','Voltage Input in Experiment');