%% WIDE AREA SEVERITY INDEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for obserbing WASI Indicator for Power System Stability Assesment
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic                                                                        % For Time Calculation
%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');                                     % Input for No of Bus to be tatsed
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))               % To match the original calling ststement of runts
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))   % casedata and dynamic casedata preparation is neccessery
mpc = runts(casedata, dynamiccasedata)                                    % calling runts for transient stability analysis

%% WASI Indicator
 x = mpc.tsResult.w .* mpc.tsResult.delta_COI ;
T_Machine = size(x,2);                                                     % To calculate no of generators in the system
lpsd = 0 ;
for i = 1 : T_Machine
    Vi = x(:,i);                                                           % Accessing dot product of ith generator.
    PSDi =  periodogram(Vi);                                               % PSD calculation for dot product of ith generator.
    lpsd = lpsd + log(PSDi);                                               % Summation of log of PSD values
end
z1 = lpsd(500);                                                            
z2 = lpsd - z1;
z3 = z2 * (-1);
z4 = z3 + z1;
correction_Factor = 20;                                                    % Taken according to the Threshold value
lpsd= z4-correction_Factor ;
hold on                                                                    % Uncomment it if you dont want to plof recent figures with previous figure
plot(lpsd,'LineWidth',2)

% Performance Index
PI = lpsd(500)

%% FIgure Properties
% Define axis limits
xlim([0 500]);

% Define axis label
xlabel('Time (5s), Sampling Time = 0.01','FontSize',34);
ylabel('WASI','FontSize',34)

% Define Axis Properties
set(gca,'YGrid','on','XGrid','on','fontsize',30,'FontName','Times New Roman')

Computation_Time = toc                                                     % Calculate Comutation Time

% EOF