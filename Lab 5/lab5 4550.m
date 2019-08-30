%% Sim
close all;
clear all;
clc;

figure
load('vmsim.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([1 10 -5 5]);

load('possim.mat');
subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,2));
hold on;
plot(data_pos(:,1),data_pos(:,3),'r --');
title('Theta_L(Simulation)');
xlabel('Time(s)');
ylabel('Angular Position(Rad)');
legend('Reference','Simulation');
axis([1 10 -2 2]);

figure();
subplot(2,1,1);
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Simulation');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([1 10 -0.6 0.6]);

subplot(2,1,2);
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Simulation(Zoomed In Near 8 sec)');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([8 8.13 0.005 0.015]);

hold on;
ess=mean(pos_diff(5821:5882));
ess_time=6:1:12;
plot(ess_time,ess*ones(size(ess_time)),'r --');
legend('Error','ess=0.0094');
%% Experimental
close all;
clear all;
clc;

figure
load('vmexp.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -5 5]);

load('posexp.mat');
subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,2));
hold on;
plot(data_pos(:,1),data_pos(:,3),'r --');
title('Theta_L(Experimental)');
xlabel('Time(s)');
ylabel('Angular Position(Rad)');
legend('Reference','Experimental');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -2 2]);

figure();
subplot(2,1,1);
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Experiment');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -0.6 0.6]);

subplot(2,1,2);
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Experiment(Zoomed in 34.3)');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([34.25 34.38 0 0.03]);

hold on;
ess=mean(pos_diff(4110:4230));
ess_time=34:1:37;
plot(ess_time,ess*ones(size(ess_time)),'r --');
legend('Error','ess=0.0133');