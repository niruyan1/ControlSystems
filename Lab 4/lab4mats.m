%% Sim
close all;
clear all;
clc;

figure
load('vm1.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([1 10 -4 4]);

load('pos1.mat');
subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,2));
hold on;
plot(data_pos(:,1),data_pos(:,3));
title('Theta_L(Simulation)');
xlabel('Time(s)');
ylabel('Theta(Rad)');
legend('Setpoint','Simulation');
axis([1 10 -2 2]);

figure();
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Simulation');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([1 10 -0.3 0.3]);

hold on;
ess=0.213;
ess_time=0:1:20;
plot(ess_time,ess*ones(size(ess_time)),'r --');
legend('Error','ess=0.213');
%% Experimental
close all;
clear all;
clc;

figure
load('vm2.mat');
subplot(2,1,1);
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -4 4]);

load('pos2.mat');
subplot(2,1,2);
plot(data_pos(:,1),data_pos(:,2));
hold on;
plot(data_pos(:,1),data_pos(:,3));
title('Theta_L(Experimental)');
xlabel('Time(s)');
ylabel('Theta(Rad)');
legend('Setpoint','Experimental');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -2 2]);

figure();
pos_diff=data_pos(:,2)-data_pos(:,3);
plot(data_vm(:,1),pos_diff);
title('Error of Experiment');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([min(data_vm(:,1)) max(data_vm(:,1)) -0.3 0.3]);

hold on;
ess=0.173;
ess_time=0:1:20;
plot(ess_time,ess*ones(size(ess_time)),'r --');
legend('Error','ess=0.173');