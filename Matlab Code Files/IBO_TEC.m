%% INDICATOR BASED ON TRANSIENT ENERGY CONVERSION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for obserbing Indicator based on transient Energy conversion
% for Power System Stability Assesment
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic                                                                        % For Time Calculation
%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');                                     % Input for No of Bus to be tatsed
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))               % To match the original calling ststement of runts
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))   % casedata and dynamic casedata preparation is neccessery
mpc = runts(casedata, dynamiccasedata)                                    % calling runts for transient stability analysis

%% Indicator based on transient Energy conversion
z = mpc.tsResult.delta_COI;
T_Machine = size(z,2);                                                     % Calculate no of generators in the system
Max_z = zeros(1,T_Machine);                                                % Initializing matrix to store maximum value of KE of generators

for i = 1 : T_Machine
    Vi = z(:,i);                                                           % Accessing KE of ith generator.
    Max_z(i) = max(Vi) ;                                                   % Maximum KE of ith generator.

end
[Max_Max_PSD,idx] = max(Max_z) ;                                           % Position of maximum KE
x = mpc.tsResult.delta_COI(:,idx);                                         % Maximum KE of the system
y=x(1);                                                                     
sz=size(x);                                                                 
x01 = ones(sz);                                                             
x0=x01(:,1);                                                                
x0=(x0*y)*2;                                                                
y=x*(-1) + x0;                                                             % Maximum PE of the system 

% Performance Index
PI = max(x) - min(y)                                                       % Performance Index Calculation

% Plot Figures
plot(x,'Color',[0.5 0 0.8],'LineWidth',3)
hold on
plot(y,'--','Color',[0.5 0 0.8],'LineWidth',3)
hold off

%% FIgure Properties
% Define Legend
legend('V_{ke}','V_{pe}');
lgd = legend;
lgd.FontSize = 32;
lgd.Position = [0.761458333333333 0.687927107061503 0.109982638586207 0.212158742691615],;

% Define axis limits
xlim([0 1000]);
%ylim([-1.5 2]);

% Define axis label
xlabel('Time (10s), Sampling Time = 0.01','FontSize',34);
ylabel('Transient Energy','FontSize',34);

% Define Axis Properties
set(gca,'YGrid','on','XGrid','on','fontsize',30,'FontName','Times New Roman')

% Create title
%title('Transient Energy');

Computation_Time = toc                                                     % Calculate Comutation Time

% EOF