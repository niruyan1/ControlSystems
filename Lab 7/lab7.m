%% Sim lab7
close all;
clear all;
clc;

figure
load('simvm.mat');
subplot(2,1,1);
plot(data_vm(:,1)-1.25,data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([0 5 -2 8]);

load('simspd.mat');
subplot(2,1,2);
plot(data_spd(:,1)-1.25,data_spd(:,2));
hold on;
plot(data_spd(:,1)-1.25,data_spd(:,3),'r --');
title('Speed(Simulation)');
xlabel('Time(s)');
ylabel('Angular Speed(Rad/s)');

ymax=max(data_spd(:,3))*ones(1,10);
peak_time=0:9;
plot(peak_time,ymax,'k --');

peak_time_t=2.5:0.001:7.6005;
peak_time= 0.0362*ones(1,5101);
plot(peak_time,peak_time_t,'--');



legend('Reference','Simulation','ymax=7.6005', 'peak time=0.0362');
axis([0 5 2 8]);

figure();
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1)-1.25,spd_diff);
title('Error of Experiment');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([0 5 -6 6]);

hold on;
peak_time=0:10;


%peak time=0.0362
%max=7.601
%ess=0
%% Exp lab7
close all;
clear all;
clc;

figure
load('expvm.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');


load('expspd.mat');
subplot(2,1,2);
plot(data_spd(:,1),data_spd(:,2));
hold on;
plot(data_spd(:,1),data_spd(:,3),'r --');
title('Speed(Experimental)');
xlabel('Time(s)');
ylabel('Angular Speed(Rad/s)');





legend('Reference','Simulation');


figure();
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Error of Experiment');
xlabel('Time(s)');
ylabel('Error(Rad)');

hold on;
peak_time=0:10;


%peak time=0.0362
%max=7.601
%ess=0