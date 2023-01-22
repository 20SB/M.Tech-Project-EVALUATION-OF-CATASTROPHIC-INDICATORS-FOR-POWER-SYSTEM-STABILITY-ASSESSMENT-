
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for calculating Generator Parameters after compiling Transient 
% Stability Analysis
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))
mpc = runts3(casedata, dynamiccasedata)

%% Plotting generator angles of ith generator
subplot(2,3,1)
plot(mpc.tsResult.delta)
%Define axis limits
xlim([0 1000]);
% Create xlabel
xlabel('Time (10s), Sampling Time = 0.01');
% Create ylabel
ylabel('\delta_i');
% Create title
title('\delta_i Versus Time');

%% Plotting System Center of Inertia
subplot(2,3,2)
plot(mpc.tsResult.COI)
%Define axis limits
xlim([0 1000]);
% Create xlabel
xlabel('Time (10s), Sampling Time = 0.01');
% Create ylabel
ylabel('\delta_{system}^{COI}');
% Create title
title('\delta_{system}^{COI} Versus Time');

%% Plotting Variation of generator angles with reference to the System Center of Inertia
subplot(2,3,3)
plot(mpc.tsResult.delta_COI)
%Define axis limits
xlim([0 1000]);
ylim([-2 3]);
% Create xlabel
xlabel('Time (10s), Sampling Time = 0.01');
% Create ylabel
ylabel('\delta_i^{COI}= \delta_i - \delta_{system}^{COI}');
% Create title
title('\delta_i^{COI} Versus Time');

%% Plotting Angular Velocity of ith generator
subplot(2,3,4)
plot(mpc.tsResult.w)
%Define axis limits
xlim([0 1000]);
% Create xlabel
xlabel('Time (10s), Sampling Time = 0.01');
% Create ylabel
ylabel('Angular Velocity (\omega)');
% Create title
title('Angular Velocity Versus Time');

%% Mechanical Torque Output of ith generator
subplot(2,3,5)
plot(mpc.tsResult.Tm_out)
%Define axis limits
xlim([0 1000]);
% Create xlabel
xlabel('Time (10s), Sampling Time = 0.01');
% Create ylabel
ylabel('Mechanical Torque');
% Create title
title('Mechanical Torque Output Versus Time');