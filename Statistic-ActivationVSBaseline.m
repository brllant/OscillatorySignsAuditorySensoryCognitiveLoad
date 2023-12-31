% Statistical Analysis and Multiple Comparison Correction 
% Activation Area vs Baseline
% Stroop Task
% Hannover, 28.4.2021
% Updated: 7.5.2021, 13.9.2021
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

datum = '210913';

%% CONDITION
analysisMODE = 1; %analysisMODE: 
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
end

%--------------------------------------------------------------------------
%% DATA I/O
%--------------------------------------------------------------------------
if analysisMODE<=2
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\VI\' group '\'];
else
    inputDataFolder  = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\ST\' group '\'];
end

outputDataFolder = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\MASTER\Stat\' group '\Data\'];
outputPlotFolder = ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\MASTER\Stat\' group '\Plot\'];
mkdir([outputDataFolder '\vsBaseline\' task '\']);
mkdir([outputPlotFolder '\vsBaseline\' task '\']);

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

%% meanRT

for foldup = 1:1
S = load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject1 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject1 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject2 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject2 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject3 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject3 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject4 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject4 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject5 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject5 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject6 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject6 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject7 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject7 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject8 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject8 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject9 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject9 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject10 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject10 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject11 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject11 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject12 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject12 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject13 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject13 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject14 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject14 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject15 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject15 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject16 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject16 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject17 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject17 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject18 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject18 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject19 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject19 = S.(['dataft_' roi]);
clear S;

S = load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
load([inputDataFolder '\' subject20 '\' Task '\TFR\ROI\Data\' roi '\dataft_' roi '.mat']);
dataft_Subject20 = S.(['dataft_' roi]);
clear S;
end
clear dataft_frontal dataft_central dataft_parietal dataft_occipital

if analysisMODE <=4
    meanRT_Subject1 = mean(dataft_Subject1.trialinfo(:,5))/1000;
    meanRT_Subject2 = mean(dataft_Subject2.trialinfo(:,5))/1000;
    meanRT_Subject3 = mean(dataft_Subject3.trialinfo(:,5))/1000;
    meanRT_Subject4 = mean(dataft_Subject4.trialinfo(:,5))/1000;
    meanRT_Subject5 = mean(dataft_Subject5.trialinfo(:,5))/1000;
    meanRT_Subject6 = mean(dataft_Subject6.trialinfo(:,5))/1000;
    meanRT_Subject7 = mean(dataft_Subject7.trialinfo(:,5))/1000;
    meanRT_Subject8 = mean(dataft_Subject8.trialinfo(:,5))/1000;
    meanRT_Subject9 = mean(dataft_Subject9.trialinfo(:,5))/1000;
    meanRT_Subject10 = mean(dataft_Subject10.trialinfo(:,5))/1000;
    meanRT_Subject11 = mean(dataft_Subject11.trialinfo(:,5))/1000;
    meanRT_Subject12 = mean(dataft_Subject12.trialinfo(:,5))/1000;
    meanRT_Subject13 = mean(dataft_Subject13.trialinfo(:,5))/1000;
    meanRT_Subject14 = mean(dataft_Subject14.trialinfo(:,5))/1000;
    meanRT_Subject15 = mean(dataft_Subject15.trialinfo(:,5))/1000;
    meanRT_Subject16 = mean(dataft_Subject16.trialinfo(:,5))/1000;
    meanRT_Subject17 = mean(dataft_Subject17.trialinfo(:,5))/1000;
    meanRT_Subject18 = mean(dataft_Subject18.trialinfo(:,5))/1000;
    meanRT_Subject19 = mean(dataft_Subject19.trialinfo(:,5))/1000;
    meanRT_Subject20 = mean(dataft_Subject20.trialinfo(:,5))/1000;

    else if (analysisMODE == 5 || analysisMODE == 6)
for foldup = 1:1
cfg = [];
cfg.trials = find(dataft_Subject1.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject1.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject1);
meanRT_Subject1 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject2.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject2.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject2);
meanRT_Subject2 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject3.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject3.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject3);
meanRT_Subject3 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject4.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject4.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject4);
meanRT_Subject4 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject5.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject5.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject5);
meanRT_Subject5 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject6.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject6.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject6);
meanRT_Subject6 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject7.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject7.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject7);
meanRT_Subject7 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject8.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject8.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject8);
meanRT_Subject8 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject9.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject9.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject9);
meanRT_Subject9 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject10.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject10.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject10);
meanRT_Subject10 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject11.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject11.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject11);
meanRT_Subject11 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject12.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject12.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject12);
meanRT_Subject12 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject13.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject13.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject13);
meanRT_Subject13 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject14.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject14.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject14);
meanRT_Subject14 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject15.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject15.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject15);
meanRT_Subject15 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject16.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject16.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject16);
meanRT_Subject16 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject17.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject17.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject17);
meanRT_Subject17 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject18.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject18.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject18);
meanRT_Subject18 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject19.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject19.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject19);
meanRT_Subject19 = mean(dataft_con.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject20.trialinfo(:,3) == 1);
cfg.trials = [cfg.trials; find(dataft_Subject20.trialinfo(:,3) == 2)]; %trialinfo Column 3 is CONDIndex, ConQuiet -> CONDInd = 1
dataft_con = ft_selectdata(cfg, dataft_Subject20);
meanRT_Subject20 = mean(dataft_con.trialinfo(:,5))/1000;
end

    else
for foldup = 1:1
cfg = [];
cfg.trials = find(dataft_Subject1.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject1.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject1);
meanRT_Subject1 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject2.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject2.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject2);
meanRT_Subject2 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject3.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject3.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject3);
meanRT_Subject3 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject4.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject4.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject4);
meanRT_Subject4 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject5.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject5.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject5);
meanRT_Subject5 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject6.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject6.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject6);
meanRT_Subject6 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject7.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject7.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject7);
meanRT_Subject7 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject8.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject8.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject8);
meanRT_Subject8 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject9.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject9.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject9);
meanRT_Subject9 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject10.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject10.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject10);
meanRT_Subject10 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject11.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject11.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject11);
meanRT_Subject11 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject12.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject12.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject12);
meanRT_Subject12 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject13.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject13.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject13);
meanRT_Subject13 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject14.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject14.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject14);
meanRT_Subject14 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject15.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject15.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject15);
meanRT_Subject15 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject16.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject16.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject16);
meanRT_Subject16 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject17.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject17.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject17);
meanRT_Subject17 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject18.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject18.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject18);
meanRT_Subject18 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject19.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject19.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject19);
meanRT_Subject19 = mean(dataft_incon.trialinfo(:,5))/1000;

cfg = [];
cfg.trials = find(dataft_Subject20.trialinfo(:,3) == 3);
cfg.trials = [cfg.trials; find(dataft_Subject20.trialinfo(:,3) == 4)]; %trialinfo Column 3 is CONDIndex, InconQuiet -> CONDInd = 3
dataft_incon = ft_selectdata(cfg, dataft_Subject20);
meanRT_Subject20 = mean(dataft_incon.trialinfo(:,5))/1000;
end
    end
end

meanRT = (meanRT_Subject1  + meanRT_Subject2  + meanRT_Subject3  + meanRT_Subject4  + meanRT_Subject5 +...
         meanRT_Subject6  + meanRT_Subject7  + meanRT_Subject8  + meanRT_Subject9  + meanRT_Subject10 +...
         meanRT_Subject11 + meanRT_Subject12 + meanRT_Subject13 + meanRT_Subject14 + meanRT_Subject15 +...
         meanRT_Subject16 + meanRT_Subject17 + meanRT_Subject18 + meanRT_Subject19 + meanRT_Subject20)/20;

clear dataft_con dataft_incon

%%
% TSA Average
cfg = [];
TSA_Subject1_avg = ft_timelockanalysis(cfg, TSA_Subject1);
TSA_Subject2_avg = ft_timelockanalysis(cfg, TSA_Subject2);
TSA_Subject3_avg = ft_timelockanalysis(cfg, TSA_Subject3);
TSA_Subject4_avg = ft_timelockanalysis(cfg, TSA_Subject4);
TSA_Subject5_avg = ft_timelockanalysis(cfg, TSA_Subject5);
TSA_Subject6_avg = ft_timelockanalysis(cfg, TSA_Subject6);
TSA_Subject7_avg = ft_timelockanalysis(cfg, TSA_Subject7);
TSA_Subject8_avg = ft_timelockanalysis(cfg, TSA_Subject8);
TSA_Subject9_avg = ft_timelockanalysis(cfg, TSA_Subject9);
TSA_Subject10_avg = ft_timelockanalysis(cfg, TSA_Subject10);
TSA_Subject11_avg = ft_timelockanalysis(cfg, TSA_Subject11);
TSA_Subject12_avg = ft_timelockanalysis(cfg, TSA_Subject12);
TSA_Subject13_avg = ft_timelockanalysis(cfg, TSA_Subject13);
TSA_Subject14_avg = ft_timelockanalysis(cfg, TSA_Subject14);
TSA_Subject15_avg = ft_timelockanalysis(cfg, TSA_Subject15);
TSA_Subject16_avg = ft_timelockanalysis(cfg, TSA_Subject16);
TSA_Subject17_avg = ft_timelockanalysis(cfg, TSA_Subject17);
TSA_Subject18_avg = ft_timelockanalysis(cfg, TSA_Subject18);
TSA_Subject19_avg = ft_timelockanalysis(cfg, TSA_Subject19);
TSA_Subject20_avg = ft_timelockanalysis(cfg, TSA_Subject20);

[TSA_Cond_avg] = ft_timelockgrandaverage(cfg, TSA_Subject1_avg,  TSA_Subject2_avg,  TSA_Subject3_avg, ... 
                                          TSA_Subject4_avg,  TSA_Subject5_avg,  TSA_Subject6_avg, ... 
                                          TSA_Subject7_avg,  TSA_Subject8_avg,  TSA_Subject9_avg,  TSA_Subject10_avg, ...
                                          TSA_Subject11_avg, TSA_Subject12_avg, TSA_Subject13_avg, ...
                                          TSA_Subject14_avg, TSA_Subject15_avg, TSA_Subject16_avg, ...
                                          TSA_Subject17_avg, TSA_Subject18_avg, TSA_Subject19_avg, TSA_Subject20_avg);

%--------------------------------------------------------------------------
%% Pooling TFR
%--------------------------------------------------------------------------
% TFR_Cond_all
cfg = [];
TFR_Cond_all = ft_appendfreq(cfg,  TFR_Subject1,  TFR_Subject2,  TFR_Subject3, ...
                                    TFR_Subject4,  TFR_Subject5,  TFR_Subject6, ...
                                    TFR_Subject7,  TFR_Subject8,  TFR_Subject9, TFR_Subject10, ...
                                    TFR_Subject11, TFR_Subject12, TFR_Subject13, ...
                                    TFR_Subject14, TFR_Subject15, TFR_Subject16, ...
                                    TFR_Subject17, TFR_Subject18, TFR_Subject19, TFR_Subject20);

% % Baseline Normalisation
cfg = [];
cfg.baselinetype = 'db';
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
cfg.baseline = [baselineTFREnd baselineTFRStart];
TFR_Subject1_avg = ft_freqdescriptives(cfg, TFR_Subject1);
TFR_Subject2_avg = ft_freqdescriptives(cfg, TFR_Subject2);
TFR_Subject3_avg = ft_freqdescriptives(cfg, TFR_Subject3);
TFR_Subject4_avg = ft_freqdescriptives(cfg, TFR_Subject4);
TFR_Subject5_avg = ft_freqdescriptives(cfg, TFR_Subject5);
TFR_Subject6_avg = ft_freqdescriptives(cfg, TFR_Subject6);
TFR_Subject7_avg = ft_freqdescriptives(cfg, TFR_Subject7);
TFR_Subject8_avg = ft_freqdescriptives(cfg, TFR_Subject8);
TFR_Subject9_avg = ft_freqdescriptives(cfg, TFR_Subject9);
TFR_Subject10_avg = ft_freqdescriptives(cfg, TFR_Subject10);
TFR_Subject11_avg = ft_freqdescriptives(cfg, TFR_Subject11);
TFR_Subject12_avg = ft_freqdescriptives(cfg, TFR_Subject12);
TFR_Subject13_avg = ft_freqdescriptives(cfg, TFR_Subject13);
TFR_Subject14_avg = ft_freqdescriptives(cfg, TFR_Subject14);
TFR_Subject15_avg = ft_freqdescriptives(cfg, TFR_Subject15);
TFR_Subject16_avg = ft_freqdescriptives(cfg, TFR_Subject16);
TFR_Subject17_avg = ft_freqdescriptives(cfg, TFR_Subject17);
TFR_Subject18_avg = ft_freqdescriptives(cfg, TFR_Subject18);
TFR_Subject19_avg = ft_freqdescriptives(cfg, TFR_Subject19);
TFR_Subject20_avg = ft_freqdescriptives(cfg, TFR_Subject20);

[TFR_Cond_avg] = ft_freqgrandaverage(cfg, TFR_Subject1_avg,  TFR_Subject2_avg,  TFR_Subject3_avg,  TFR_Subject4_avg,  TFR_Subject5_avg,  TFR_Subject6_avg,  TFR_Subject7_avg,  TFR_Subject8_avg,  TFR_Subject9_avg,  TFR_Subject10_avg,...
                                          TFR_Subject11_avg, TFR_Subject12_avg, TFR_Subject13_avg, TFR_Subject14_avg, TFR_Subject15_avg, TFR_Subject16_avg, TFR_Subject17_avg, TFR_Subject18_avg, TFR_Subject19_avg, TFR_Subject20_avg);



clear TFR_Subject1  TFR_Subject2  TFR_Subject3  TFR_Subject4  TFR_Subject5 ...
      TFR_Subject6  TFR_Subject7  TFR_Subject8  TFR_Subject9  TFR_Subject10 ...
      TFR_Subject11 TFR_Subject12 TFR_Subject13 TFR_Subject14 TFR_Subject15 ...
      TFR_Subject16 TFR_Subject17 TFR_Subject18 TFR_Subject19 TFR_Subject20

clear dataft_Subject1  dataft_Subject2  dataft_Subject3  dataft_Subject4  dataft_Subject5 ...
      dataft_Subject6  dataft_Subject7  dataft_Subject8  dataft_Subject9  dataft_Subject10 ...
      dataft_Subject11 dataft_Subject12 dataft_Subject13 dataft_Subject14 dataft_Subject15 ...
      dataft_Subject16 dataft_Subject17 dataft_Subject18 dataft_Subject19 dataft_Subject20 ...
      
return;

%--------------------------------------------------------------------------
%% Dividing Activation Period into same length with Baseline
%--------------------------------------------------------------------------
TFR_compare = TFR_Cond_all;
% Length each section: ca. 0.6 sec, check number of TimeBin!

cfg = [];
cfg.keeptrials = 'yes';
cfg.latency = [-0.8 -0.2];
TFR_compare_bl = ft_freqdescriptives(cfg, TFR_compare);

cfg = [];
cfg.keeptrials = 'yes';
cfg.latency = [-0.2 0.4];
TFR_compare_a1 = ft_freqdescriptives(cfg, TFR_compare);

cfg = [];
cfg.keeptrials = 'yes';
cfg.latency = [0.3 0.9];
TFR_compare_a2 = ft_freqdescriptives(cfg, TFR_compare);

cfg = [];
cfg.keeptrials = 'yes';
cfg.latency = [0.8 1.4];
TFR_compare_a3 = ft_freqdescriptives(cfg, TFR_compare);

cfg = [];
cfg.keeptrials = 'yes';
cfg.latency = [1.4 2];
TFR_compare_a4 = ft_freqdescriptives(cfg, TFR_compare);

%---

% Adjusting Time
TFR_compare_a1.time = linspace(0,0.6,length(TFR_compare_a1.time)); %so Time will be from 0 to 0.6 sec
TFR_compare_bl.time = TFR_compare_a1.time;
TFR_compare_a2.time = TFR_compare_a1.time;
TFR_compare_a3.time = TFR_compare_a1.time;
TFR_compare_a4.time = TFR_compare_a1.time;

return;

%---

% Calculating statistic for a1
for foldup = 1:1
cfg = [];
cfg.channel          = 'all';
cfg.method           = 'montecarlo';
cfg.statistic        = 'ft_statfun_actvsblT';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan        = 0;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.025;
cfg.numrandomization = 500;
cfg.neighbours = [];
% Length each section: 0.6 sec
cfg.latency   = [0 0.6];
cfg.frequency = 'all';
ntrials = size(TFR_compare_a1.powspctrm,1);
design  = zeros(2,2*ntrials);
design(1,1:ntrials) = 1;
design(1,ntrials+1:2*ntrials) = 2;
design(2,1:ntrials) = [1:ntrials];
design(2,ntrials+1:2*ntrials) = [1:ntrials];
cfg.design  = design;
cfg.ivar    = 1;
cfg.uvar    = 2;
cfg.design  = design;
cfg.ivar    = 1;
[TFR_stat_a1] = ft_freqstatistics(cfg, TFR_compare_a1, TFR_compare_bl);

% Calculating statistics for a2
for foldup = 1:1
cfg = [];
cfg.channel          = 'all';
cfg.method           = 'montecarlo';
cfg.statistic        = 'ft_statfun_actvsblT';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan        = 0;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.025;
cfg.numrandomization = 500;
cfg.neighbours = [];
% Length each section: 0.6 sec
cfg.latency   = [0 0.6]%[0.025 0.625];
cfg.frequency = 'all';
ntrials = size(TFR_compare_a1.powspctrm,1);
design  = zeros(2,2*ntrials);
design(1,1:ntrials) = 1;
design(1,ntrials+1:2*ntrials) = 2;
design(2,1:ntrials) = [1:ntrials];
design(2,ntrials+1:2*ntrials) = [1:ntrials];
cfg.design  = design;
cfg.ivar    = 1;
cfg.uvar    = 2;
cfg.design  = design;
cfg.ivar    = 1;
[TFR_stat_a2] = ft_freqstatistics(cfg, TFR_compare_a2, TFR_compare_bl);

% Calculating statistic for a3
for foldup = 1:1
cfg = [];
cfg.channel          = 'all';
cfg.method           = 'montecarlo';
cfg.statistic        = 'ft_statfun_actvsblT';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan        = 0;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.025;
cfg.numrandomization = 500;
cfg.neighbours = [];
% Length each section: 0.6 sec
cfg.latency   = [0 0.6];%[0.025 0.625];
cfg.frequency = 'all';
ntrials = size(TFR_compare_a1.powspctrm,1);
design  = zeros(2,2*ntrials);
design(1,1:ntrials) = 1;
design(1,ntrials+1:2*ntrials) = 2;
design(2,1:ntrials) = [1:ntrials];
design(2,ntrials+1:2*ntrials) = [1:ntrials];
cfg.design  = design;
cfg.ivar    = 1;
cfg.uvar    = 2;
cfg.design  = design;
cfg.ivar    = 1;
[TFR_stat_a3] = ft_freqstatistics(cfg, TFR_compare_a3, TFR_compare_bl);

% Calculating statistic for a4
for foldup = 1:1
cfg = [];
cfg.channel          = 'all';
cfg.method           = 'montecarlo';
cfg.statistic        = 'ft_statfun_actvsblT';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan        = 0;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.025;
cfg.numrandomization = 500;
cfg.neighbours = [];
% Length each section: 0.6 sec
cfg.latency   = [0 0.6];%[0.025 0.625];
cfg.frequency = 'all';
ntrials = size(TFR_compare_a1.powspctrm,1);
design  = zeros(2,2*ntrials);
design(1,1:ntrials) = 1;
design(1,ntrials+1:2*ntrials) = 2;
design(2,1:ntrials) = [1:ntrials];
design(2,ntrials+1:2*ntrials) = [1:ntrials];
cfg.design  = design;
cfg.ivar    = 1;
cfg.uvar    = 2;
cfg.design  = design;
cfg.ivar    = 1;
[TFR_stat_a4] = ft_freqstatistics(cfg, TFR_compare_a4, TFR_compare_bl);

%---

%Correcting time
TFR_stat_a1.time = linspace(-0.2, 0.4, length(TFR_stat_a1.time)); 
TFR_stat_a2.time = linspace(0.3, 0.9,  length(TFR_stat_a2.time));
TFR_stat_a3.time = linspace(0.8, 1.4,  length(TFR_stat_a3.time));
TFR_stat_a4.time = linspace(1.4, 2,    length(TFR_stat_a4.time));

%---

%-------------------------------------------------------------------------------------------------
% Plotting
%-------------------------------------------------------------------------------------------------

% Plotting seg for a1
for foldup = 1:1
% Fieldtrip Drawing Function
for foldup = 1:1
cfg = [];
cfg.parameter = 'stat';
cfg.maskparameter = 'mask';
cfg.maskstyle = 'outline';
%cfg.maskalpha = 0.3;
cfg.colormap = 'jet';
cfg.zlim = [-4 4];
cfg.ylim = [2 128];
ft_singleplotTFR(cfg,TFR_stat_a1);
end
% Draw with outline
for foldup = 1:1
% Draw Full image
% Draw Again in imagesc
cfg = [];
TFR_imagesc  = ft_freqbaseline(cfg, TFR_stat_a1);
meanPow_TFR  = squeeze(mean(TFR_imagesc.stat(1,:,:), 1));
figure;
imagesc(TFR_stat_a1.time, TFR_stat_a1.freq, meanPow_TFR);
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
% Get Pixel for full image
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
close (gcf);
% Draw again in contourf logarithmic
figure;
TFR_contourf_ori = contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
close (gcf);
% Draw outline
% Get Value for mask image 
maskBin(:,:) = TFR_stat_a1.mask(1,:,:); %freqXtime
% Draw again in contourf with mask as contour and in logarithmic
figure;
contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
xlim([TFR_stat_a1.time(1) TFR_stat_a1.time(end)])
axis xy; 
colorbar; colormap(jet(64));
hold on
contour(timeBin, freqBin, maskBin,'LevelList',1, 'LineWidth', 1, 'LineColor', 'k');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
end

    % Plotting seg for a2
    for foldup = 1:1
    % Fieldtrip Drawing Function
    for foldup = 1:1
    cfg = [];
    cfg.parameter = 'stat';
    cfg.maskparameter = 'mask';
    cfg.maskstyle = 'outline';
    %cfg.maskalpha = 0.3;
    cfg.colormap = 'jet';
    cfg.zlim = [-4 4];
    cfg.ylim = [2 128];
    ft_singleplotTFR(cfg,TFR_stat_a2);
    end
    % Draw with outline
    for foldup = 1:1
    % Draw Full image
    % Draw Again in imagesc
    cfg = [];
    TFR_imagesc  = ft_freqbaseline(cfg, TFR_stat_a2);
    meanPow_TFR  = squeeze(mean(TFR_imagesc.stat(1,:,:), 1));
    figure;
    imagesc(TFR_stat_a2.time, TFR_stat_a2.freq, meanPow_TFR);
    caxis([-4 4]);
    ylim([2 128]);
    axis xy; 
    colorbar; colormap(jet(64));
    % Get Pixel for full image
    fig = gcf;
    figHandle       = get(gca,'Children');
    timeBin         = get(figHandle, 'XData');
    freqBin     	= get(figHandle, 'YData');
    powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
    close (gcf);
    % Draw again in contourf logarithmic
    figure;
    TFR_contourf_ori = contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
    caxis([-4 4]);
    ylim([2 128]);
    axis xy; 
    colorbar; colormap(jet(64));
    set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
    close (gcf);
    % Draw outline
    % Get Value for mask image 
    maskBin(:,:) = TFR_stat_a2.mask(1,:,:); %freqXtime
    % Draw again in contourf with mask as contour and in logarithmic
    figure;
    contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
    caxis([-4 4]);
    ylim([2 128]);
    xlim([TFR_stat_a2.time(1) TFR_stat_a2.time(end)])
    axis xy; 
    colorbar; colormap(jet(64));
    hold on
    contour(timeBin, freqBin, maskBin,'LevelList',1, 'LineWidth', 1, 'LineColor', 'k');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
    set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
    end

% Plotting seg for a3
for foldup = 1:1
% Fieldtrip Drawing Function
for foldup = 1:1
cfg = [];
cfg.parameter = 'stat';
cfg.maskparameter = 'mask';
cfg.maskstyle = 'outline';
%cfg.maskalpha = 0.3;
cfg.colormap = 'jet';
cfg.zlim = [-4 4];
cfg.ylim = [2 128];
ft_singleplotTFR(cfg,TFR_stat_a3);
end
% Draw with outline
for foldup = 1:1
% Draw Full image
% Draw Again in imagesc
cfg = [];
TFR_imagesc  = ft_freqbaseline(cfg, TFR_stat_a3);
meanPow_TFR  = squeeze(mean(TFR_imagesc.stat(1,:,:), 1));
figure;
imagesc(TFR_stat_a3.time, TFR_stat_a3.freq, meanPow_TFR);
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
% Get Pixel for full image
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
close (gcf);
% Draw again in contourf logarithmic
figure;
TFR_contourf_ori = contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
close (gcf);
% Draw outline
% Get Value for mask image 
maskBin(:,:) = TFR_stat_a3.mask(1,:,:); %freqXtime
% Draw again in contourf with mask as contour and in logarithmic
figure;
contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
xlim([TFR_stat_a3.time(1) TFR_stat_a3.time(end)])
axis xy; 
colorbar; colormap(jet(64));
hold on
contour(timeBin, freqBin, maskBin,'LevelList',1, 'LineWidth', 1, 'LineColor', 'k');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
end

% Plotting seg for a4
for foldup = 1:1
% Fieldtrip Drawing Function
for foldup = 1:1
cfg = [];
cfg.parameter = 'stat';
cfg.maskparameter = 'mask';
cfg.maskstyle = 'outline';
%cfg.maskalpha = 0.3;
cfg.colormap = 'jet';
cfg.zlim = [-4 4];
cfg.ylim = [2 128];
ft_singleplotTFR(cfg,TFR_stat_a4);
end
% Draw with outline
for foldup = 1:1
% Draw Full image
% Draw Again in imagesc
cfg = [];
TFR_imagesc  = ft_freqbaseline(cfg, TFR_stat_a4);
meanPow_TFR  = squeeze(mean(TFR_imagesc.stat(1,:,:), 1));
figure;
imagesc(TFR_stat_a4.time, TFR_stat_a4.freq, meanPow_TFR);
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
% Get Pixel for full image
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime
close (gcf);
% Draw again in contourf logarithmic
figure;
TFR_contourf_ori = contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
axis xy; 
colorbar; colormap(jet(64));
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
close (gcf);
% Draw outline
% Get Value for mask image 
maskBin(:,:) = TFR_stat_a4.mask(1,:,:); %freqXtime
% Draw again in contourf with mask as contour and in logarithmic
figure;
contourf(timeBin, freqBin, powerBin,64,'linestyle','none');
caxis([-4 4]);
ylim([2 128]);
xlim([TFR_stat_a4.time(1) TFR_stat_a4.time(end)])
axis xy; 
colorbar; colormap(jet(64));
hold on
contour(timeBin, freqBin, maskBin,'LevelList',1, 'LineWidth', 1, 'LineColor', 'k');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
end

close all;

% TFR and TSA Complett
for foldup = 1:1
TFR = TFR_Cond_avg;
TSA = TSA_Cond_avg;

%---

% Transfered Parameter
baselineTFREnd      = -0.8;
baselineTFRStart    = -0.2;
prestimOffset       = -1;
poststimOffset      = 2;
foiLow              = 1;
foiHigh             = 128;

%---

cfg = [];
cfg.baselinetype = 'db';
colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');
zInfo = 'dB';
cfg.baseline = [baselineTFREnd baselineTFRStart];
TFR_imagesc  = ft_freqbaseline(cfg, TFR);
meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1));

% Draw Again
figure;
imagesc(TFR.time, TFR.freq, meanPow_TFR);
xlim([prestimOffset poststimOffset]);
ylim([foiLow foiHigh]);
caxis([-4 4]);
axis xy; 
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar; colormap(jet(64));

% Get Pixel
fig = gcf;
figHandle       = get(gca,'Children');
timeBin         = get(figHandle, 'XData');
freqBin     	= get(figHandle, 'YData');
powerBin(:,:)	= get(figHandle, 'CData'); %freqXtime

close(gcf);
   
%---

timeBinIntrp = timeBin;
freqBinIntrp = freqBin;
powerIntrp   = powerBin;

lowestYlimLog = 2;

   % FINAL PLOT TFR 
    figure;
    % Draw TFR    
    contourf(timeBinIntrp, freqBinIntrp, powerIntrp,64,'LineStyle','none');
    xlim([prestimOffset poststimOffset]);
    ylim([lowestYlimLog foiHigh]);
    caxis([-2 2])
    %caxis([-4 4]);
    axis xy; 
    c = colorbar; c.Label.String = colorbartext; colormap(jet(64));
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    title(['TFR: All Subject, ' task ', ' ROI]);
    set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
    yl2 = yline (4,':'); 
    yl3 = yline (8,':'); 
    yl4 = yline(13,':');
    yl5 = yline(30,':'); 

    hold on;
  
    % Draw outline 
    for foldup = 1:1
        % Draw outline for a1
        for foldup = 1:1
        % Get Value for mask image 
        maskBin(:,:) = TFR_stat_a1.mask(1,:,:); %freqXtime
        %adding losing time in mask
        samplingRate = round(length(timeBin)/3);
        losingTimeFront = round(round(TFR_stat_a1.time(1)*samplingRate)+(1*samplingRate));   %Missing freqXtime-Matrix before maskBin
        maskBin_complete1 = cat(2,(zeros(length(freqBin),losingTimeFront)),maskBin);
        losingTimeBack = size(timeBin,2)-size(maskBin_complete1,2);                           %Missing freqXtime-Matrix after maskBin
        maskBin_complete1 = cat(2,maskBin_complete1, (zeros(length(freqBin),losingTimeBack))); %Resulting maskBin_complete with full time

        %---
        
        % Draw outline for a2
        for foldup = 1:1
        % Get Value for mask image 
        maskBin(:,:) = TFR_stat_a2.mask(1,:,:); %freqXtime
        %adding losing time in mask
        samplingRate = round(length(timeBin)/3);
        losingTimeFront = round(round(TFR_stat_a2.time(1)*samplingRate)+(1*samplingRate));   %Missing freqXtime-Matrix before maskBin
        maskBin_complete2 = cat(2,(zeros(length(freqBin),losingTimeFront)),maskBin);
        losingTimeBack = size(timeBin,2)-size(maskBin_complete2,2);                           %Missing freqXtime-Matrix after maskBin
        maskBin_complete2 = cat(2,maskBin_complete2, (zeros(length(freqBin),losingTimeBack))); %Resulting maskBin_complete with full time
            
        %---

        % Draw outline for a3
        for foldup = 1:1
        % Get Value for mask image 
        maskBin(:,:) = TFR_stat_a3.mask(1,:,:); %freqXtime
        %adding losing time in mask
        samplingRate = round(length(timeBin)/3);
        losingTimeFront = round(round(TFR_stat_a3.time(1)*samplingRate)+(1*samplingRate));     %Missing freqXtime-Matrix before maskBin
        maskBin_complete3 = cat(2,(zeros(length(freqBin),losingTimeFront)),maskBin);
        losingTimeBack = size(timeBin,2)-size(maskBin_complete3,2);                           %Missing freqXtime-Matrix after maskBin
        maskBin_complete3 = cat(2,maskBin_complete3, (zeros(length(freqBin),losingTimeBack))); %Resulting maskBin_complete with full time

        %---
        
        % Draw outline for a4
        for foldup = 1:1
        % Get Value for mask image 
        maskBin(:,:) = TFR_stat_a4.mask(1,:,:); %freqXtime
        %adding losing time in mask
        samplingRate = round(length(timeBin)/3);
        losingTimeFront = round(round(TFR_stat_a4.time(1)*samplingRate)+(1*samplingRate));    %Missing freqXtime-Matrix before maskBin
        maskBin_complete4 = cat(2,(zeros(length(freqBin),losingTimeFront)),maskBin);
        losingTimeBack = size(timeBin,2)-size(maskBin_complete4,2);                           %Missing freqXtime-Matrix after maskBin
        maskBin_complete4 = cat(2,maskBin_complete4, (zeros(length(freqBin),losingTimeBack))); %Resulting maskBin_complete with full time
        
        %---
       
            % Merge
            maskBin_complete = or(maskBin_complete1,maskBin_complete2);
            maskBin_complete = or(maskBin_complete,maskBin_complete3);
            maskBin_complete = or(maskBin_complete,maskBin_complete4);
 
            % Draw again in contourf with mask as contour and in logarithmic
            contour(timeBin, freqBin, maskBin_complete,'LevelList',1, 'LineWidth', 0.5, 'LineColor', 'k', 'LineStyle', '-');%LevelList = Threshold, by Binary Mask = 0 is all, 1 is the mask
            set(gca,'yscale','log','ytick',[2 4 8 13 20 25 30 50 75 100 125]);
            hold on
    end
