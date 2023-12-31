% Preprocessing EEG Data
% Created: Hannover, 1.12.2020
% Updated: 12.1.2021
% Uploaded: 7.9.2023
% Brilliant - VIANNA/MHH

%--------------------------------------------------------------------------
%% DATA I/O
%--------------------------------------------------------------------------
subject                 = 'XXXX00';
rawDataName             = 'EEG_00_0';
NoiseInd                = 2; %NoiseInd for VI: 1: In Quiet - 2: In Noise
datum                   = '210818';
task                    = 'Vowel Identification';
taskShort               = 'VI';
group                   = 'NHYoung';

if NoiseInd == 1
	condDataFolder = 'VIQuiet';
else if NoiseInd == 2
        condDataFolder = 'VINoise';
    end
end

if NoiseInd == 1
    noiseInfo = 'in Quiet';
    noiseInfoShort = 'Quiet';
else if NoiseInd == 2
        noiseInfo = 'in Noise';
        noiseInfoShort = 'Noise';
    end
end

rawDataFolder       	= ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\EEG2Analyze\MACA_IL\MACA_IL_Source\MACA_IL_Source_BrainvisionConverted\' group '\' subject '\'];
outputDataFolder	= ['D:\Brilliant_Dokumenten\Daten\Brilliant_Datenmaster\MarkersOfAuditoryCognitiveAging\Brilliant_Analysis\MACA_IL\' taskShort '\' group '\' subject '\' condDataFolder '\Preprocessing\Data\'];
mkdir(outputDataFolder);

%--------------------------------------------------------------------------
%% STEP 1: IMPORT DATA
%--------------------------------------------------------------------------
headerfile  = [rawDataFolder rawDataName '.vhdr'];
datafile    = [rawDataFolder rawDataName '.eeg'];

cfg = [];
cfg.headerfile  = headerfile;
cfg.datafile    = datafile;
dataft_imported = ft_preprocessing(cfg);
dataft_aktuell    = dataft_imported;

%--------------------------------------------------------------------------
%%  STEP 2: LABELING
%--------------------------------------------------------------------------
% Rename labels;
channelIndex = find(strcmp(dataft_aktuell.label, 'C5A'));
dataft_aktuell.label{channelIndex} = 'FC5';
channelIndex = strcmp(dataft_aktuell.label, 'C1A');
dataft_aktuell.label{channelIndex} = 'FC1';
channelIndex = find(strcmp(dataft_aktuell.label, 'C2A'));
dataft_aktuell.label{channelIndex} = 'FC2';
channelIndex = find(strcmp(dataft_aktuell.label, 'C6A'));
dataft_aktuell.label{channelIndex} = 'FC6';
channelIndex = find(strcmp(dataft_aktuell.label, 'T3L'));
dataft_aktuell.label{channelIndex} = 'TP7';
channelIndex = find(strcmp(dataft_aktuell.label, 'TCP1'));
dataft_aktuell.label{channelIndex} = 'CP5';
channelIndex = find(strcmp(dataft_aktuell.label, 'C1P'));
dataft_aktuell.label{channelIndex} = 'CP1';
channelIndex = find(strcmp(dataft_aktuell.label, 'C2P'));
dataft_aktuell.label{channelIndex} = 'CP2';
channelIndex = find(strcmp(dataft_aktuell.label, 'TCP2'));
dataft_aktuell.label{channelIndex} = 'CP6';
channelIndex = find(strcmp(dataft_aktuell.label, 'T4L'));
dataft_aktuell.label{channelIndex} = 'TP8';
channelIndex = find(strcmp(dataft_aktuell.label, 'C3P'));
dataft_aktuell.label{channelIndex} = 'CP3';
channelIndex = find(strcmp(dataft_aktuell.label, 'C4P'));
dataft_aktuell.label{channelIndex} = 'CP4';
channelIndex = find(strcmp(dataft_aktuell.label, 'C3A'));
dataft_aktuell.label{channelIndex} = 'FC3';
channelIndex = find(strcmp(dataft_aktuell.label, 'F4A'));
dataft_aktuell.label{channelIndex} = 'AF4';
channelIndex = find(strcmp(dataft_aktuell.label, 'CB1'));
dataft_aktuell.label{channelIndex} = 'PO7';
channelIndex = find(strcmp(dataft_aktuell.label, 'CZA'));
dataft_aktuell.label{channelIndex} = 'FCz';
channelIndex = find(strcmp(dataft_aktuell.label, 'CB2'));
dataft_aktuell.label{channelIndex} = 'PO8';
channelIndex = find(strcmp(dataft_aktuell.label, 'P2P'));
dataft_aktuell.label{channelIndex} = 'PO2';
channelIndex = find(strcmp(dataft_aktuell.label, 'PZA'));
dataft_aktuell.label{channelIndex} = 'CPz';
channelIndex = find(strcmp(dataft_aktuell.label, 'PZP'));
dataft_aktuell.label{channelIndex} = 'POz';
channelIndex = find(strcmp(dataft_aktuell.label, 'P1P'));
dataft_aktuell.label{channelIndex} = 'PO1';
channelIndex = find(strcmp(dataft_aktuell.label, 'F3A'));
dataft_aktuell.label{channelIndex} = 'AF3';
channelIndex = find(strcmp(dataft_aktuell.label, 'C4A'));
dataft_aktuell.label{channelIndex} = 'FC4';
channelIndex = find(strcmp(dataft_aktuell.label, 'P3P'));
dataft_aktuell.label{channelIndex} = 'PO3';
channelIndex = find(strcmp(dataft_aktuell.label, 'P4P'));
dataft_aktuell.label{channelIndex} = 'PO4';

clear channelIndex;
dataft_label = dataft_aktuell;
channelLabel = dataft_aktuell.label;

%--------------------------------------------------------------------------
%% STEP 3: EPOCH
%--------------------------------------------------------------------------
cfg = [];
cfg.headerfile  = headerfile;
cfg.datafile    = datafile;
cfg.trialdef.eventtype 	= 'Stimulus';
cfg.trialdef.eventvalue = {'t100','t101','t1','t2'};
prestimOffset   = -1; % in seconds
poststimOffset  = 2;  % in seconds
epochPaddingFront   = 1.5;
epochPaddingBack    = 1.5;
cfg.trialdef.prestim    = -prestimOffset + epochPaddingFront;
cfg.trialdef.poststim   = poststimOffset + epochPaddingBack;
cfg.trialfun = 'trialdefinition_MACA_IL_VI';
cfg = ft_definetrial(cfg);

dataft_epoch        = ft_preprocessing(cfg);
dataft_epoch.label  = channelLabel;
dataft_aktuell      = dataft_epoch;
meanRT              = nanmean(dataft_epoch.trialinfo(:,5)); %trialinfo Column 5 is REACTION TIME 

%--------------------------------------------------------------------------
%% STEP 4: REVERSING POLARITY
%--------------------------------------------------------------------------
numChannels     = length((dataft_aktuell.trial{1,1}(:,1)));
numTrials       = length(dataft_aktuell.trial);

for chanInd = 1:numChannels
    for trialInd = 1:numTrials
        dataft_aktuell.trial{1,trialInd}(chanInd,:)= -dataft_aktuell.trial{1,trialInd}(chanInd,:);  
    end
end
dataft_reversed = dataft_aktuell;

%--------------------------------------------------------------------------
%% STEP 5: HIGHPASS FILTER of 0.1 Hz
%--------------------------------------------------------------------------
cfg = [];
cfg.hpfilter         = 'yes';
cfg.hpfreq           = 0.1;
cfg.hpinstabilityfix = 'reduce';

dataft_filter       = ft_preprocessing(cfg, dataft_aktuell);
dataft_filter.label = channelLabel;
dataft_aktuell      = dataft_filter ;

%--------------------------------------------------------------------------
%% STEP 6: ARTIFACT REJECTION I: ICA
%--------------------------------------------------------------------------
    % ICA will performed on dataft_temp (1-Hz highpass filtered data) (https://sccn.ucsd.edu/wiki/Makoto%27s_preprocessing_pipeline)
    dataft_temp = dataft_reversed;

    cfg = [];
    cfg.hpfilter            = 'yes';
    cfg.hpfreq              = 1;
    cfg.hpinstabilityfix    = 'reduce';
    dataft_temp             = ft_preprocessing(cfg, dataft_temp);
    dataft_temp.label       = channelLabel;

% ICA Calculation for dataft_temp
%---
cfg = [];
cfg.method      = 'runica'; %this is the default and uses the implementation from EEGLAB
%cfg.channel     = {'all', '-EB', '-elB28', '-elB29', '-elB30', '-elB31', '-elB32', '-abdo', '-thor',  '-xyz', '-MKR', '-a1', '-a2', '-VEOR', '-VEOL', '-el064'};
cfg.channel     = {'all', '-FC6', '-EB', '-elB28', '-elB29', '-elB30', '-elB31', '-elB32', '-abdo', '-thor',  '-xyz', '-MKR', '-a1', '-a2', '-VEOR', '-VEOL', '-el064'};
compICA_temp    = ft_componentanalysis(cfg, dataft_temp);
return;

%Human Factor
cfg = [];
cfg.component = 1:20;
cfg.comment   = 'no';    
cfg.layout    = 'eeg1010.lay';
cfg.colorbar  = 'EastOutside';  
ft_topoplotIC(cfg, compICA_temp);
return;

cfg = [];
cfg.allowoverlap    = 'yes';
cfg.channel         = [1:20];
cfg.viewmode        = 'component';             
cfg.compscale       = 'local';
cfg.shading         = 'flat';
cfg.interplimits    = 'mask';
cfg.contournum      = 5;
cfg.fontsize        = 5;
cfg.layout          = 'eeg1010.lay';
ft_databrowser(cfg, compICA_temp);
return;

suspiciousCompTest = [1,];

cfg = [];
cfg.layout                      = 'eeg1010.lay';
[suspiciousComp_temp_logic]     = ft_icabrowser(cfg, compICA_temp); %Using ft_icabrowser, you have choosen which component to reject

return;

suspiciousComp_temp = find(suspiciousComp_temp_logic)';
return;

% ICA Calculation for dataft_aktuell with Unmixing Matrix and Topolabel from compICA_temp
cfg = [];
cfg.unmixing        = compICA_temp.unmixing;
cfg.topolabel       = compICA_temp.topolabel;
%cfg.channel         = {'all', '-EB', '-elB28', '-elB29', '-elB30', '-elB31', '-elB32', '-abdo', '-thor',  '-xyz', '-MKR', '-a1', '-a2', '-VEOR', '-VEOL', '-el064'};
cfg.channel         = {'all', '-FC6', '-EB', '-elB28', '-elB29', '-elB30', '-elB31', '-elB32', '-abdo', '-thor',  '-xyz', '-MKR', '-a1', '-a2', '-VEOR', '-VEOL', '-el064'};
compICA             = ft_componentanalysis(cfg, dataft_aktuell);

cfg = [];
cfg.component   = suspiciousComp_temp;     %Passing the components
dataft_ICA      = ft_rejectcomponent(cfg, compICA, dataft_aktuell); % Reject the ICA Components

%INSPECTION
%---
% Inspections TSA
    cfg = [];
    cfg.trials = 'all';
    TSA_beforeICA   = ft_timelockanalysis(cfg, dataft_aktuell);
    TSA_afterICA    = ft_timelockanalysis(cfg, dataft_ICA);

    figure;
    choosenChannel = 'Fz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    subplot(3,3,2); 
    plot(TSA_beforeICA.time, TSA_beforeICA.avg(channelIndex,:));
    hold on;
    plot(TSA_afterICA.time, TSA_afterICA.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before ICA','After ICA');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'Cz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    subplot(3,3,5);
    plot(TSA_beforeICA.time, TSA_beforeICA.avg(channelIndex,:));
    hold on;
    plot(TSA_afterICA.time, TSA_afterICA.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before ICA','After ICA');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'Pz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    subplot(3,3,8); 
    plot(TSA_beforeICA.time, TSA_beforeICA.avg(channelIndex,:));
    hold on;
    plot(TSA_afterICA.time, TSA_afterICA.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before ICA','After ICA');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'T3';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,4); 
    plot(TSA_beforeICA.time, TSA_beforeICA.avg(channelIndex,:));
    hold on;
    plot(TSA_afterICA.time, TSA_afterICA.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before ICA','After ICA');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'T4';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,6); 
    plot(TSA_beforeICA.time, TSA_beforeICA.avg(channelIndex,:));
    hold on;
    plot(TSA_afterICA.time, TSA_afterICA.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before ICA','After ICA');
    xlim([-1 2]);
    hold off;

%---   
% Inspections TFR   
% For Inspection only compute TFR for 1 Channel, 
% with relatively low temporal distance of toi

    choosenChannel = 'Cz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    
    cfg            = [];
    cfg.method     = 'wavelet';
    cfg.width      = 6;
    cfg.output     = 'pow';
    cfg.channel    = choosenChannel;
    foiLow         = 1;
    foiHigh        = 100;
    cfg.foi        = foiLow:1:foiHigh;
    cfg.toi        = prestimOffset:0.005:poststimOffset;   
    cfg.trials     = 'all';
    
    TFR_beforeICA   = ft_freqanalysis(cfg, dataft_aktuell);    
    TFR_afterICA    = ft_freqanalysis(cfg, dataft_ICA);  
    
    % Wavelet Plotting
    baselineTFREnd      = -0.8;
    baselineTFRStart    = -0.2;
    
    figure;
    
    cfg = [];
    cfg.baselinetype = 'db';
    colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');
    zInfo = 'dB';
    cfg.baseline = [baselineTFREnd baselineTFRStart];
    TFR_imagesc  = ft_freqbaseline(cfg, TFR_beforeICA);
    meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1)); %First Index is the channelIndex, since TFR Computation is for a channel -> channelIndex is 1
    subplot(2,1,1);
    imagesc(TFR_beforeICA.time, TFR_beforeICA.freq, meanPow_TFR);
    xlim([prestimOffset poststimOffset]);
    ylim([foiLow foiHigh]);
    caxis([-4 4]);
    axis xy; 
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    colorbar; colormap(jet(64));
    title(['TFR before ICA of Channel: ' choosenChannel]);
    
    cfg = [];
    cfg.baselinetype = 'db';
    colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');
    zInfo = 'dB';
    cfg.baseline = [baselineTFREnd baselineTFRStart];
    TFR_imagesc  = ft_freqbaseline(cfg, TFR_afterICA);
    meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1)); %First Index is the channelIndex, since TFR Computation is for a channel -> channelIndex is 1
    subplot(2,1,2);
    imagesc(TFR_afterICA.time, TFR_afterICA.freq, meanPow_TFR);
    xlim([prestimOffset poststimOffset]);
    ylim([foiLow foiHigh]);
    caxis([-4 4]);
    axis xy; 
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    colorbar; colormap(jet(64));
    title(['TFR after ICA of Channel: ' choosenChannel]);
%---

return;

%Are you happy with the ICA Result? If yes, continue
dataft_aktuell = dataft_ICA;    
channelLabel = dataft_aktuell.label;  %Order of the Label Changed, Unused Channels are now at the end

%--------------------------------------------------------------------------
%% STEP 7: ARTIFACT REJECTION II: VISUAL 
%--------------------------------------------------------------------------
%Human Factor
%VISUAL 1
cfg = [];
cfg.channel     = {'all', '-EB', '-elB28', '-elB29', '-elB30', '-elB31', '-elB32', '-abdo', '-thor',  '-xyz', '-MKR', '-a1', '-a2', '-VEOR', '-VEOL', '-el064'};
cfg.method      = 'trial';
dataft_visual   = ft_rejectvisual(cfg, dataft_aktuell);
return;

rejectedTrials = [5, 6, 7, 8, 14, 15, 16, 27, 28, 29, 43, 44, 49, 75, 76, 77, 78, 105, 106, 107, 134, 135, 136, 137, 138, 144, 145, 146, 148, 149, 150, 151, 152, 153, 159, 160, 161, 162, 163, 164, 165, 166, 179, 180, 184, 187, 188, 195, 196];

%If repeated
cfg = [];
trialList                           = 1:length(dataft_aktuell.trial);
acceptedtrials                      = find(~ismember(trialList, rejectedTrials));
cfg.trials                          = acceptedtrials;
dataft_visual                       = ft_selectdata(cfg, dataft_aktuell);
dataft_visual.cfg.rejectedTrials    = rejectedTrials;

return;

%VISUAL 2
cfg = [];
cfg.allowoverlap    = 'yes';
cfg.channel         = [1:58];
cfg.ylim            = [-150 150]
cfg.viewmode        = 'butterfly';             
cfg.compscale       = 'local';
cfg.shading         = 'flat';
cfg.interplimits    = 'mask';
cfg.contournum      = 5;
cfg.fontsize        = 5;
ft_databrowser(cfg, dataft_visual);
return;

cfg = [];
rejectedTrials2 = [103, 104];

trialList                           = 1:length(dataft_visual.cfg.trials);
acceptedtrials                      = find(~ismember(trialList, rejectedTrials2));
cfg.trials                          = acceptedtrials;
dataft_visual                       = ft_selectdata(cfg, dataft_visual);
dataft_visual.cfg.rejectedTrials    = rejectedTrials;
dataft_visual.cfg.rejectedTrials2   = rejectedTrials2;
dataft_visual.cfg.brokenChannel     = {'FC6';};
return;

% INSPECTION
%---
% Inspections TSA
    cfg = [];
    cfg.trials = 'all';
    TSA_beforeVisual = ft_timelockanalysis(cfg, dataft_aktuell);

    cfg = [];
    cfg.trials = 'all';
    TSA_afterVisual = ft_timelockanalysis(cfg, dataft_visual);

    figure;
    choosenChannel = 'Fz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    subplot(3,3,2); 
    plot(TSA_beforeVisual.time, TSA_beforeVisual.avg(channelIndex,:));
    hold on;
    plot(TSA_afterVisual.time, TSA_afterVisual.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before Visual','After Visual');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'Cz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,5);
    plot(TSA_beforeVisual.time, TSA_beforeVisual.avg(channelIndex,:));
    hold on;
    plot(TSA_afterVisual.time, TSA_afterVisual.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before Visual','After Visual');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'Pz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,8); 
    plot(TSA_beforeVisual.time, TSA_beforeVisual.avg(channelIndex,:));
    hold on;
    plot(TSA_afterVisual.time, TSA_afterVisual.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before Visual','After Visual');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'T3';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,4); 
    plot(TSA_beforeVisual.time, TSA_beforeVisual.avg(channelIndex,:));
    hold on;
    plot(TSA_afterVisual.time, TSA_afterVisual.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before Visual','After Visual');
    xlim([-1 2]);
    hold off;

    choosenChannel = 'T4';
    channelIndex = find(strcmp(channelLabel, choosenChannel));    
    subplot(3,3,6); 
    plot(TSA_beforeVisual.time, TSA_beforeVisual.avg(channelIndex,:));
    hold on;
    plot(TSA_afterVisual.time, TSA_afterVisual.avg(channelIndex,:));
    title (['TSA of channel ' choosenChannel]);
    legend('Before Visual','After Visual');
    xlim([-1 2]);
    hold off;

%---   
% Inspections TFR   
% For Inspection only compute TFR for 1 Channel, 
% with relatively low temporal distance of toi
    
    % Wavelet Analysis Parameter
    choosenChannel = 'Cz';
    channelIndex = find(strcmp(channelLabel, choosenChannel));
    
    cfg            = [];
    cfg.method     = 'wavelet';
    cfg.width      = 6;
    cfg.output     = 'pow';
    cfg.channel    = choosenChannel;
    foiLow         = 1;
    foiHigh        = 100;
    cfg.foi        = foiLow:1:foiHigh;
    cfg.toi        = prestimOffset:0.005:poststimOffset;   
    cfg.trials     = 'all';
    
    TFR_beforeVisual   = ft_freqanalysis(cfg, dataft_aktuell);    
    TFR_afterVisual    = ft_freqanalysis(cfg, dataft_visual);  
    
    % Wavelet Plotting
    baselineTFREnd      = -0.8;
    baselineTFRStart    = -0.2;
 
    figure;
    
    cfg = [];
    cfg.baselinetype = 'db';
    colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');
    zInfo = 'dB';
    cfg.baseline = [baselineTFREnd baselineTFRStart];
    TFR_imagesc  = ft_freqbaseline(cfg, TFR_beforeVisual);
    meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1)); %First Index is the channelIndex, since TFR Computation is for a channel -> channelIndex is 1
    subplot(2,1,1);
    imagesc(TFR_beforeVisual.time, TFR_beforeVisual.freq, meanPow_TFR);
    xlim([prestimOffset poststimOffset]);
    ylim([foiLow foiHigh]);
    caxis([-4 4]);
    axis xy; 
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    colorbar; colormap(jet(64));
    title(['TFR before Visual of Channel: ' choosenChannel]);
    
    cfg = [];
    cfg.baselinetype = 'db';
    colorbartext = strcat('Power [dB re Baseline: ' , '(', num2str(baselineTFREnd), 's)', ' - ',  '(', num2str(baselineTFRStart), 's)', ']');
    zInfo = 'dB';
    cfg.baseline = [baselineTFREnd baselineTFRStart];
    TFR_imagesc  = ft_freqbaseline(cfg, TFR_afterVisual);
    meanPow_TFR  = squeeze(mean(TFR_imagesc.powspctrm(1,:,:), 1)); %First Index is the channelIndex, since TFR Computation is for a channel -> channelIndex is 1
    subplot(2,1,2);
    imagesc(TFR_afterVisual.time, TFR_afterVisual.freq, meanPow_TFR);
    xlim([prestimOffset poststimOffset]);
    ylim([foiLow foiHigh]);
    caxis([-4 4]);
    axis xy; 
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    colorbar; colormap(jet(64));
    title(['TFR after Visual of Channel: ' choosenChannel]);
%---
    
return;

%Are you happy with the Visual Inspection Result? If yes, continue
dataft_aktuell = dataft_visual;
