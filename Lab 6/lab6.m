%% Sim lab6
close all;
clear all;
clc;

figure
load('sim_vm.mat');
subplot(2,1,1);
data_vm(:,1)=data_vm(:,1)-1.25;
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([0 5 -2 8]);

load('sim_spd.mat');
subplot(2,1,2);
data_spd(:,1)=data_spd(:,1)-1.25;
plot(data_spd(:,1),data_spd(:,2));
hold on;
plot(data_spd(:,1),data_spd(:,3),'r --');
title('Speed of Motor(Simulation)');
xlabel('Time(s)');
ylabel('Angular Velocity(Rad)');
axis([0 5 1 10]);

%peak time
peak_time=0.05;
ptime_y=-1:1:10;
plot(peak_time*ones(size(ptime_y)),ptime_y,'k --');

%ymax
ymax=max(data_spd(:,3));
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'g --');

legend('Reference','Simulation','Peak Time=0.05','max=7.752');

%error
figure();
subplot(2,1,1);
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Error of Experiment');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([0 5 -6 6]);

subplot(2,1,2);
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Steady State Error');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([0.6 0.65 -1e-10 1e-10]);
%peak time=0.05;
%percent_overdhoot=2.52
%ess=0;

%% Experiment
close all;
clear all;
clc;

figure
load('exp_vol.mat');
subplot(2,1,1);
data_vm(:,1)=data_vm(:,1)-11.25;
plot(data_vm(:,1),data_vm(:,2));
title('Vm');
xlabel('Time(s)');
ylabel('Voltage(V)');
axis([0 3.5 -2 8]);

load('exp_spd.mat');
subplot(2,1,2);
data_spd(:,1)=data_spd(:,1)-11.25;
plot(data_spd(:,1),data_spd(:,2));
hold on;
plot(data_spd(:,1),data_spd(:,3),'r --');
title('Speed of Motor(Implementation)');
xlabel('Time(s)');
ylabel('Angular Velocity(Rad)');
axis([0 3.5 1 10]);

%peak time
peak_time=0.05;
ptime_y=-1:1:10;
plot(peak_time*ones(size(ptime_y)),ptime_y,'k --');

%ymax
ymax=max(data_spd(:,3));
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'g --');

legend('Reference','Implementation','Peak Time=0.044','max=8.187');

figure();
subplot(2,1,1);
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Error of Implementation');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([0 3.5 -6 6]);

subplot(2,1,2);
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Steady State Error');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([0.6 0.65 -0.5 0.5]);
hold on;
%ess
ymax= -9.4460e-05;
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'r --');
legend('Error','ess=-9.4460e-05');

figure;
load('noise_spd.mat');
data_spd(:,1)=data_spd(:,1)-5;
plot(data_spd(:,1),data_spd(:,3));

hold on;
title('Noise(Speed)');
xlabel('Time(s)');
ylabel('Angular Velocity(Rad)');
axis([0 3.5 7.2 7.8]);
d_s=data_spd(:,1);
d_s=d_s(1:4669);

d_w=data_spd(:,3);
d_w=d_w(1:4669);

noise=[d_s d_w-7.5];
%ripple
ripple_time=1.75;
ripple=min(data_spd(:,3)):1e-3:max(data_spd(:,3));
plot(ripple_time*ones(size(ripple)),ripple,'k --');
legend('Noise','Ripple=0.2831');

%%%%%%%%%%%%%%%%%%REMOVE NOISE
load('exp_spd.mat');
figure;
subplot(2,1,1);
data_spd(:,1)=data_spd(:,1)-11.25;
plot(data_spd(:,1),data_spd(:,3),'r --');
hold on;
title('Maximum Peak of Motor(Noisy)');
xlabel('Time(s)');
ylabel('Angular Velocity(Rad)');
axis([1.5 3.5 6 9]);
%ymax
ymax=max(data_spd(:,3));
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'g --');
legend('Implementation','max=8.187');

wo_noise=data_spd(:,3)-0.1416;
subplot(2,1,2);
plot(data_spd(:,1),wo_noise,'r --');
hold on;
title('Maximum Peak of Motor(Minus Noise)');
xlabel('Time(s)');
ylabel('Angular Velocity(Rad)');
axis([1.5 3.5 6 9]);
%ymax
ymax=max(wo_noise);
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'g --');
legend('Implementation','max=8.045');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
spd_diff=data_spd(:,2)-data_spd(:,3);
plot(data_spd(:,1),spd_diff);
title('Steady State Error(Noisy)');
xlabel('Time(s)');
ylabel('Error(Rad)');
axis([2.5 3.5 -0.5 0.5]);
hold on;
%ess
ymax= -9.4460e-05;
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'r --');
legend('Error','ess=-9.4460e-05');

subplot(2,1,2);
for n=1:length(spd_diff)
    if(spd_diff(n)<0)
        spd_diff(n)=spd_diff(n)+0.1416;
        if(spd_diff(n)>0)
            spd_diff(n)=0;
        end
    else
        spd_diff(n)=spd_diff(n)-0.1416;
        if(spd_diff(n)<0)
            spd_diff(n)=0;
        end
    end
end
plot(data_spd(:,1),spd_diff);
title('Steady State Error(Reduced Noise)')
ylabel('Error(Rad)');
axis([2.5 3.5 -0.5 0.5]);
hold on;
%ess
ymax= 0;
max_line=-1:1:6;
plot(max_line,ymax*ones(size(max_line)),'r --');
legend('Error','ess=0');