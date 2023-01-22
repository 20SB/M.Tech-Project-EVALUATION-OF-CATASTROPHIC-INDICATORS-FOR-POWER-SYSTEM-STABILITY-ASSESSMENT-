%% INTERAREA STABILITY PREDICTION INDEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is for obserbing ISPI Indicator for Power System Stability Assesment
% @Author: Subha Biswal

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic                                                                        % For Time Calculation
%% Initial Calling Statements
No_of_Buses = input('No of Buses = ');                                     % Input for No of Bus to be tatsed
casedata = str2num(strcat('data.case',int2str(No_of_Buses)))               % To match the original calling ststement of runts
dynamiccasedata = str2num(strcat('data.case',int2str(No_of_Buses),'dd'))   % casedata and dynamic casedata preparation is neccessery
mpc = runts(casedata, dynamiccasedata)                                    % calling runts for transient stability analysis

%% ISPI Indicator
x = mpc.tsResult.w .* mpc.tsResult.delta_COI ;;
y = sum(x,2);
maximum = max(y) - min(y);
T1 = 10;                                                                   % Threshold_1 for below 33% calculation
T2 = 100;                                                                  % Threshold_2 for below 66% calculation
Peak_Assumed = 1000010;                                                    % Maximum Peak assumption for below 100% calculation
Peak_Assigned = 10000;                                                     % Maximum Peak assumption for below 100% calculation

if maximum <= T1
    A = (maximum/T1)*100;
    B = 33*(A/100) 
elseif maximum <= T2
    A = (maximum/T2)*100;
    B = 66*(A/100);
    if(B < 33)
        B=33+(B/33)
    else
        B
    end  
else
    if maximum >=Peak_Assumed
        maximum = Peak_Assigned;
    end
    A = (maximum/Peak_Assigned)*100;
    B = 100*(A/100);
    if(B < 66)
        B=66+(B/66)
    else
        B
    end
end

Computation_Time = toc                                                     % Calculate Comutation Time

% EOF