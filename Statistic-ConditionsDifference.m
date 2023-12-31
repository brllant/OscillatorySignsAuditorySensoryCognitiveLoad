% Statistical Analysis 
% Conditions Differenz
% Created: Hannover, 28.4.2021
% Edited: 30.9.2021
% Uploaded: 7.9.2023
% Brilliant - VIANNA/MHH

%% SUBJECT INDEXING
subject1 = 'XXXX01';
subject2 = 'XXXX02';
subject3 = 'XXXX03';
subject4 = 'XXXX04';
subject5 = 'XXXX05';
subject6 = 'XXXX06';
subject7 = 'XXXX07';
subject8 = 'XXXX08';
subject9 = 'XXXX09';
subject10 = 'XXXX10';
subject11 = 'XXXX11';
subject12 = 'XXXX12';
subject13 = 'XXXX13';
subject14 = 'XXXX14';
subject15 = 'XXXX15';
subject16 = 'XXXX16';
subject17 = 'XXXX17';
subject18 = 'XXXX18';
subject19 = 'XXXX19';
subject20 = 'XXXX20';
group = 'NHYoung';

datum = '230816';

%--------------------------------------------------------------------------
%% CONDITION 1
%--------------------------------------------------------------------------
analysisMODE = 7; %analysisMODE: 
                  %1: VIQuiet, 2: VINoise,
                  %3: STQuiet, 4: STNoise,
                  %5: conQuiet, 6: conNoise,
                  %7: inconQuiet, 8: inconNoise,
                     
ROIMODE = 2; %ROIMODE:
             %1: Frontal, 2: Central, %3: Parietal, %4: Occipital

for foldup = 1:1
%% ROI

switch ROIMODE
    case 1
        ROI = 'Frontal';
        roi = 'frontal';
    case 2
        ROI = 'Central';
        roi = 'central';        
    case 3
        ROI = 'Parietal';
        roi = 'parietal';
    case 4
        ROI = 'Occipital';  
        roi = 'occipital';        
end

%% Task
switch analysisMODE
    case 1
        Task = 'VIQuiet'; 
        DataNameTFR = 'TFR_VI';
        DataNameTSA = 'TSA_VI';
        task = Task;
    case 2
        Task = 'VINoise';
        DataNameTFR = 'TFR_VI';
        DataNameTSA = 'TSA_VI';
        task = Task;        
    case 3
        Task = 'STQuiet';
        DataNameTFR = 'TFR_ST';
        DataNameTSA = 'TSA_ST';
        task = Task;        
    case 4
        Task = 'STNoise';
        DataNameTFR = 'TFR_ST';
        DataNameTSA = 'TSA_ST';
        task = Task;        
    case 5
        Task = 'STQuiet';
        DataNameTFR = 'TFR_con';
        DataNameTSA = 'TSA_con';
        task = 'conQuiet';        
    case 6
        Task = 'STNoise';
        DataNameTFR = 'TFR_con';
        DataNameTSA = 'TSA_con';
        task = 'conNoise';        
    case 7
        Task = 'STQuiet';
        DataNameTFR = 'TFR_incon';
        DataNameTSA = 'TSA_incon';
        task = 'inconQuiet';        
    case 8
        Task = 'STNoise';
        DataNameTFR = 'TFR_incon';
        DataNameTSA = 'TSA_incon';
        task = 'inconNoise';
end

task1 = task;

%% DATA I/O

%INPUT PLOT
if analysisMODE<=2
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\VI\' group '\'];
else
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\ST\' group '\'];
end

for foldup = 1:1
S = load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject1 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject1 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject2 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject2 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject3 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject3 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject4 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject4 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject5 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject5 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject6 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject6 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject7 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject7 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject8 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject8 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject9 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject9 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject10 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject10 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject11 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject11 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject12 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject12 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject13 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject13 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject14 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject14 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject15 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject15 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject16 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject16 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject17 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject17 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject18 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject18 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject19 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject19 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject20 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject20 = S.([DataNameTSA '_alltrls']);
clear S;

end
clear TFR_VI_alltrls TSA_VI_alltrls TFR_ST_alltrls TSA_ST_alltrls TFR_con_alltrls TSA_con_alltrls TFR_incon_alltrls TSA_incon_alltrls

%% Pooling TFR Condition 1

% TFR_Cond1_all
cfg = [];
TFR_Cond1_all = ft_appendfreq(cfg,  TFR_Subject1,  TFR_Subject2,  TFR_Subject3, ...
                                    TFR_Subject4,  TFR_Subject5,  TFR_Subject6, ...
                                    TFR_Subject7,  TFR_Subject8,  TFR_Subject9, TFR_Subject10, ...
                                    TFR_Subject11, TFR_Subject12, TFR_Subject13, ...
                                    TFR_Subject14, TFR_Subject15, TFR_Subject16, ...
                                    TFR_Subject17, TFR_Subject18, TFR_Subject19, TFR_Subject20);
                                
% Baseline Normalisation
cfg = [];
cfg.baselinetype = 'db';
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
cfg.baseline = [baselineTFREnd baselineTFRStart];
TFR_Cond1_all = ft_freqbaseline(cfg, TFR_Cond1_all);

% Average
cfg = [];
TFR_Cond1_avg = ft_freqdescriptives(cfg, TFR_Cond1_all);

end

%--------------------------------------------------------------------------
%% CONDITION 2
%--------------------------------------------------------------------------
analysisMODE = 1; %analysisMODE: 
                  %1: VIQuiet, 2: VINoise,
                  %3: STQuiet, 4: STNoise,
                  %5: conQuiet, 6: conNoise,
                  %7: inconQuiet, 8: inconNoise,
                     
%ROIMODE = 0; %ROIMODE:
             %1: Frontal, 2: Central, %3: Parietal, %4: Occipital

for foldup = 1:1
%% ROI

switch ROIMODE
    case 1
        ROI = 'Frontal';
        roi = 'frontal';
    case 2
        ROI = 'Central';
        roi = 'central';        
    case 3
        ROI = 'Parietal';
        roi = 'parietal';
    case 4
        ROI = 'Occipital';  
        roi = 'occipital';        
end

%% Task

switch analysisMODE
    case 1
        Task = 'VIQuiet'; 
        DataNameTFR = 'TFR_VI';
        DataNameTSA = 'TSA_VI';
        task = Task;
    case 2
        Task = 'VINoise';
        DataNameTFR = 'TFR_VI';
        DataNameTSA = 'TSA_VI';
        task = Task;        
    case 3
        Task = 'STQuiet';
        DataNameTFR = 'TFR_ST';
        DataNameTSA = 'TSA_ST';
        task = Task;        
    case 4
        Task = 'STNoise';
        DataNameTFR = 'TFR_ST';
        DataNameTSA = 'TSA_ST';
        task = Task;        
    case 5
        Task = 'STQuiet';
        DataNameTFR = 'TFR_con';
        DataNameTSA = 'TSA_con';
        task = 'conQuiet';        
    case 6
        Task = 'STNoise';
        DataNameTFR = 'TFR_con';
        DataNameTSA = 'TSA_con';
        task = 'conNoise';        
    case 7
        Task = 'STQuiet';
        DataNameTFR = 'TFR_incon';
        DataNameTSA = 'TSA_incon';
        task = 'inconQuiet';        
    case 8
        Task = 'STNoise';
        DataNameTFR = 'TFR_incon';
        DataNameTSA = 'TSA_incon';
        task = 'inconNoise';
end

task2 = task;

%% DATA I/O

%INPUT PLOT
if analysisMODE<=2
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\VI\' group '\'];
else
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\ST\' group '\'];
end

%OUTPUT DATA
outputDataFolder = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\MASTER\Stat\Diff\' group '\Data\'];
mkdir (outputDataFolder);

%OUTPUT PLOT
outputPlotFolder = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\MASTER\Stat\Diff\' group '\Plot\'];
mkdir (outputPlotFolder);

for foldup = 1:1
S = load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject1 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject1 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject2 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject2 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject3 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject3 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject4 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject4 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject5 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject5 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject6 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject6 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject7 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject7 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject8 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject8 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject9 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject9 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject10 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject10 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject11 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject11 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject12 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject12 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject13 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject13 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject14 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject14 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject15 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject15 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject16 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject16 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject17 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject17 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject18 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject18 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject19 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject19 = S.([DataNameTSA '_alltrls']);
clear S;

S = load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTFR '_alltrls.mat']);
TFR_Subject20 = S.([DataNameTFR '_alltrls']);
clear S;
S = load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' ROI '\' DataNameTSA '_alltrls.mat']);
TSA_Subject20 = S.([DataNameTSA '_alltrls']);
clear S;

end
clear TFR_VI_alltrls TSA_VI_alltrls TFR_ST_alltrls TSA_ST_alltrls TFR_con_alltrls TSA_con_alltrls TFR_incon_alltrls TSA_incon_alltrls

%% Pooling TFR Condition 2

% TFR_Cond2_all
cfg = [];
TFR_Cond2_all = ft_appendfreq(cfg,  TFR_Subject1,  TFR_Subject2,  TFR_Subject3, ...
                                    TFR_Subject4,  TFR_Subject5,  TFR_Subject6, ...
                                    TFR_Subject7,  TFR_Subject8,  TFR_Subject9, TFR_Subject10, ...
                                    TFR_Subject11, TFR_Subject12, TFR_Subject13, ...
                                    TFR_Subject14, TFR_Subject15, TFR_Subject16, ...
                                    TFR_Subject17, TFR_Subject18, TFR_Subject19, TFR_Subject20);
                               
% Baseline Normalisation
cfg = [];
cfg.baselinetype = 'db';
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
cfg.baseline = [baselineTFREnd baselineTFRStart];
TFR_Cond2_all = ft_freqbaseline(cfg, TFR_Cond2_all);

% Average
cfg = [];
TFR_Cond2_avg = ft_freqdescriptives(cfg, TFR_Cond2_all);

end

clear TFR_Subject1 TFR_Subject2 TFR_Subject3 TFR_Subject4 TFR_Subject5 TFR_Subject6 TFR_Subject7 TFR_Subject8 TFR_Subject9 TFR_Subject10 TFR_Subject11 TFR_Subject12 TFR_Subject13 TFR_Subject14 TFR_Subject15 TFR_Subject16 TFR_Subject17 TFR_Subject18 TFR_Subject19 TFR_Subject20;
clear TSA_Subject1 TSA_Subject2 TSA_Subject3 TSA_Subject4 TSA_Subject5 TSA_Subject6 TSA_Subject7 TSA_Subject8 TSA_Subject9 TSA_Subject10 TSA_Subject11 TSA_Subject12 TSA_Subject13 TSA_Subject14 TSA_Subject15 TSA_Subject16 TSA_Subject17 TSA_Subject18 TSA_Subject19 TSA_Subject20;

%return;

%--------------------------------------------------------------------------
%% Combine CONDITION 1 and CONDITION 2
%--------------------------------------------------------------------------
TFR_Cond1_all.freq = round(TFR_Cond1_all.freq);
TFR_Cond1_avg.freq = round(TFR_Cond1_avg.freq);
TFR_Cond2_all.freq = round(TFR_Cond2_all.freq);
TFR_Cond2_avg.freq = round(TFR_Cond2_avg.freq);

cfg = [];
cfg.tolerance = 1e-2; %1e-5
%cfg.appenddim = 'rpt';
TFR_all = ft_appendfreq(cfg, TFR_Cond1_all, TFR_Cond2_all);

% TFR Averaging
cfg = [];
TFR_avg = ft_freqdescriptives(cfg, TFR_all);

%--------------------------------------------------------------------------
% Statistic 1-128 Hz (delta theta alpha beta gamma)
%--------------------------------------------------------------------------
for foldup = 1:1
freqLabel = '1bis128Hz';
cfg = [];
cfg.channel = [];
cfg.frequency = [1 128];
cfg.latency = [-0.2 2];
cfg.statistic = 'indepsamplesT';
cfg.ivar = 1;
cfg.design = zeros(1, size(TFR_all.trialinfo,1));
cfg.design(1, (1:length(TFR_Cond1_all.trialinfo))) = 1;
cfg.design(1,(length(TFR_Cond1_all.trialinfo)+1:end)) = 2;
cfg.method           = 'montecarlo';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan        = 0;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.025;
cfg.numrandomization = 500; %1000 is recommended, but takes much longer
cfg.neighbours = [];
%TFR_stat = ft_freqstatistics(cfg, TFR_logpow);
TFR_stat = ft_freqstatistics(cfg, TFR_all);

%--------------------------------------------------------------------------
%Plotting
%--------------------------------------------------------------------------
% Saving powerBin for Condition1
foiLow              = 1;
foiHigh             = 128;
prestimOffset       = -1; % in seconds
poststimOffset      = 2;  % in seconds
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');

    cfg = [];
    lowestYlim          = 1.6;
    cfg.xlim            = [prestimOffset poststimOffset];    % specified in seconds
    cfg.ylim            = [lowestYlim foiHigh];     
    cfg.zlim            = [-2 2];%[-Inf Inf]; %'maxabs';
    cfg.baseline        = [baselineTFREnd baselineTFRStart];
    ft_singleplotTFR(cfg, TFR_Cond1_avg); 
    colormap(jet(64));
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    xticks(-1:0.2:2.2); 
    yticks([2 4 8 13 20 30 35 50 65 80 95 110 125])
    ax = gca;
    ax.YAxis.FontSize = 8;
    ax.XAxis.FontSize = 8;
    yl1 = yline (2,':'); 
    yl2 = yline (4,':'); 
    yl3 = yline (8,':'); 
    yl4 = yline(13,':');
    yl5 = yline(30,':'); 
    xline (0);
    xl1 = xline(baselineTFREnd,'--','Baseline','LabelHorizontalAlignment','right');
    xl1.FontSize = 9;
    xl2 = xline(baselineTFRStart,'--');
    close(gcf);
    
TFR_imagesc  = ft_freqbaseline(cfg, TFR_Cond1_avg);
meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1));

figure;
imagesc(TFR_Cond1_avg.time, TFR_Cond1_avg.freq, meanPow_TFR);
xlim([prestimOffset poststimOffset]);
ylim([foiLow foiHigh]);
caxis([-2 2]);
axis xy; 
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar; colormap(jet(64));
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
close (gcf);
powerBin_Cond1 = powerBin;
clear powerBin;

% Saving powerBin for Condition2
for foldup = 1:1
foiLow              = 1;
foiHigh             = 128;
prestimOffset       = -1; % in seconds
poststimOffset      = 2;  % in seconds
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');

    cfg = [];
    lowestYlim          = 1.6;
    cfg.xlim            = [prestimOffset poststimOffset];    % specified in seconds
    cfg.ylim            = [lowestYlim foiHigh];     
    cfg.zlim            = [-2 2];%[-Inf Inf]; %'maxabs';
    cfg.baseline        = [baselineTFREnd baselineTFRStart];
    ft_singleplotTFR(cfg, TFR_Cond2_avg); 
    colormap(jet(64));
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    xticks(-1:0.2:2.2); 
    yticks([2 4 8 13 20 30 35 50 65 80 95 110 125])
    ax = gca;
    ax.YAxis.FontSize = 8;
    ax.XAxis.FontSize = 8;
    yl1 = yline (2,':'); 
    yl2 = yline (4,':'); 
    yl3 = yline (8,':'); 
    yl4 = yline(13,':');
    yl5 = yline(30,':'); 
    xline (0);
    xl1 = xline(baselineTFREnd,'--','Baseline','LabelHorizontalAlignment','right');
    xl1.FontSize = 9;
    xl2 = xline(baselineTFRStart,'--');
    close(gcf);

TFR_imagesc  = ft_freqbaseline(cfg, TFR_Cond2_avg);
meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1));

figure;
imagesc(TFR_Cond2_avg.time, TFR_Cond2_avg.freq, meanPow_TFR);
xlim([prestimOffset poststimOffset]);
ylim([foiLow foiHigh]);
caxis([-2 2]);
axis xy; 
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar; colormap(jet(64));
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
close (gcf);
powerBin_Cond2 = powerBin;
clear powerBin;

% Difference calculated through powerBin
powerBin_Diff = powerBin_Cond1 - powerBin_Cond2;
powerBin = powerBin_Diff;
timeBinIntrp = TFR_all.time;
freqBinIntrp = TFR_all.freq;
powerIntrp = interp2(timeBin', freqBin, powerBin, timeBinIntrp', freqBinIntrp, 'nearest');

    figure;
    TFRPlot = contourf(timeBinIntrp, freqBinIntrp, powerIntrp,64,'linestyle','none');
    %TFRPlot = contourf(timeBinIntrp, freqBinIntrp, powerIntrp,'linestyle','none');
    xlim([prestimOffset poststimOffset]);
    ylim([lowestYlimLog foiHigh]);
    caxis([-1.5 1.5]);
    axis xy; 
    c = colorbar; c.Label.String = colorbartext; colormap(jet(64));
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);

    yl2 = yline (4,':'); 
    yl3 = yline (8,':'); 
    yl4 = yline(13,':');
    yl5 = yline(30,':'); 

hold on;

maskBin(:,:) = TFR_stat.mask(1,:,:); %freqXtime

%adding losing frequency in mask
% maskBin_complete = cat(1,zeros(1,length(TFR_stat.time)),maskBin); %Adding Bottom Freq
% maskBin_complete = cat(1,maskBin_complete, zeros((length(TFR_avg.freq)-length(TFR_stat.freq))-1,length(TFR_stat.time))); %Adding Top Freq
maskBin_complete = maskBin;

%adding losing time in mask
losingTimeFront  = length(TFR_avg.time)-length(TFR_stat.time);
maskBin_complete = cat(2,(zeros(length(freqBin),losingTimeFront)), maskBin_complete);

% Draw again in contourf with mask as contour and in logarithmic
contour(timeBinIntrp, freqBinIntrp, maskBin_complete,'LevelList',1, 'LineWidth', 0.5, 'LineColor', 'k', 'LineStyle', '-');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
title(['TFR Difference: ' task1 ' minus ' task2 ', ' ROI]);
