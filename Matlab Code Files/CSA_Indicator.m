%% INDICATOR BASED ON DOT PRODUCT (CSA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for obserbing CSA Indicator for Power System Stability Assesment
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic                                                                        % For Time Calculation
%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');                                     % Input for No of Bus to be tatsed
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))               % To match the original calling ststement of runts
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))   % casedata and dynamic casedata preparation is neccessery
mpc = runts(casedata, dynamiccasedata)                                    % calling runts for transient stability analysis

%% CSA Indicator

x = mpc.tsResult.w .* mpc.tsResult.delta_COI;                              % Calculate dot product
y = sum(x,2);                                                              % Calculate Sumation of dot product

% Performance Index
PI = max(y) - min(y)                                                       % calculate performance index

% Plot Figure
plot(y,'LineWidth',2)                                                      % Plot CSA vs time
hold on                                                                    % Uncomment it if you dont want to plof recent figures with previous figure

%% FIgure Properties
% Define axis limits
xlim([0 800]);
%ylim([-5 10]);

% Define axis label
xlabel('Time (8s), Sampling Time = 0.01','FontSize',34);
ylabel('CSA','FontSize',34)

% Define Axis Properties
set(gca,'YGrid','on','XGrid','on','fontsize',30,'FontName','Times New Roman')

%Create title
%title('CSA versus time (zoomed Y-axis)');

Computation_Time = toc                                                     % Calculate Comutation Time

% EOF