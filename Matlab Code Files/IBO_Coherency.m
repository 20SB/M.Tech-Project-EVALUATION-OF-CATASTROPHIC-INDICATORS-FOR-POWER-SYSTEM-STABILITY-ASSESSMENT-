%% INDICATOR BASED ON COHERENCY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for obserbing Indicator based on Coherency for Power System 
% Stability Assesment
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic                                                                        % For Time Calculation
%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');                                     % Input for No of Bus to be tatsed
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))               % To match the original calling ststement of runts
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))   % casedata and dynamic casedata preparation is neccessery
mpc = runts(casedata, dynamiccasedata)                                    % calling runts for transient stability analysis

%% Indicator based on Coherency
T_Machine = size(mpc.tsResult.delta_COI,2) ;                               % Calculate no of machines present in the bus

% Performance Index
for i = 1 : T_Machine
    RAngle = mpc.tsResult.delta_COI(:,i);                                  % Rotor Angle of ith generator
    PI(i) = max(RAngle) - min(RAngle);                                     % Performance Index for each machine
end
PI = max(PI)                                                               % Performance Index for whole system

% Plot Figure
plot(mpc.tsResult.delta_COI,'LineWidth',2)                                 % plot generator angles

%% FIgure Properties
% Define axis limits
xlim([0 1000]);
% ylim([-2 3]);

% Define axis label
xlabel('Time (10s), Sampling Time = 0.01','FontSize',34);
ylabel('\delta_i^{COI}= \delta_i - \delta_{system}^{COI}','FontSize',34);

% Define Axis Properties
set(gca,'YGrid','on','XGrid','on','fontsize',30,'FontName','Times New Roman')

% Create title
% title('\delta_i^{COI} Versus Time');

% Define Legend
legend('G1','G2','G3','G4');
lgd = legend;
lgd.FontSize = 32;
lgd.Position = [0.761458333333333 0.687927107061503 0.109982638586207 0.212158742691615],;

Computation_Time = toc                                                     % Calculate Comutation Time

% EOF