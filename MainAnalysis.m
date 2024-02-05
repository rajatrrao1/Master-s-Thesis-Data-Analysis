%% Statistical analysis from the paper entitled:

% Created by Yamil Vidal (hvidaldossantos@gmail.com)

clear; clc; close all

PathData   = fullfile(pwd,'Data'); % Data path
NoAnsLimit = .2;                   % Max allowed percentage of missing answers for each conditions
LaTeX      = 0;                    % LaTeX formatted output. Boolean

D = LoadData(PathData);


%% Get performance data
% Reject participants that don't have an answer in more than NoAnsLimit of the trials
%[ D ] = RejectSubjects_EachCond( D, NoAnsLimit );
%fprintf('\r');

[ D ] = GetPerformance( D, 1:size(D(1).cond,1) );
%[ D ] = GetPerformance( D, 1:8 );

% Unpack
dPrime_exp = [D(:).dPrime_exp];
dPrime_une = [D(:).dPrime_une];
criterion_exp = [D(:).criterion_exp];
criterion_une = [D(:).criterion_une];
rt_exp = [D(:).rt_exp];
rt_une = [D(:).rt_une];
hit_exp = [D(:).hit_exp];
hit_une = [D(:).hit_une];
fa_exp = [D(:).fa_exp];
fa_une = [D(:).fa_une];
conf_une = [D(:).conf_une];
conf_exp = [D(:).conf_exp];

%% Run stats
fprintf('##### hits #####\r\r');
data_exp = hit_exp;
data_une = hit_une;
RunStats

fprintf('##### false alarms #####\r\r');
data_exp = fa_exp;
data_une = fa_une;
RunStats

fprintf('##### confusions #####\r\r');
data_exp = conf_exp;
data_une = conf_une;
RunStats

fprintf('##### d prime #####\r\r');
data_exp = dPrime_exp;
data_une = dPrime_une;
RunStats

fprintf('##### criterion #####\r\r');
data_exp = criterion_exp;
data_une = criterion_une;
RunStats

fprintf('##### reaction time #####\r\r');
data_exp = rt_exp;
data_une = rt_une;
RunStats

%% Create tables

TableName = 'Table_prop.xlsx';
MakeTables

D = GetPerformance_trial_count(D);

TableName = 'Table_trials.xlsx';
MakeTables


%% Plotting dprime

cfg.x       = dPrime_une; % Data on x axis
cfg.y       = dPrime_exp; % Data on y axis

cfg.xLabel  = '{\itd''} unexpected tone'; % Label of x axis
cfg.yLabel  = '{\itd''} expected tone'; % Label of y axis

cfg.LowLim  = -.5;      % Lower bound of scale
cfg.HighLim = 4;       % Upper bound of scale

%cfg.MeanC   = [0, 179, 255]./255; % Color of mean dot
%cfg.MeanC   = [1, 0, 0]; % Color of mean dot RED
cfg.MeanC   = [1, .5, 0]; % Color of mean dot ORANGE
%cfg.MeanC   = [16, 183, 27]./255; % Color of mean dot GREEN

MainPlotting

%% Plotting criterion

cfg.x       = criterion_une; % Data on x axis
cfg.y       = criterion_exp; % Data on y axis

cfg.xLabel  = '{\itCriterion} unexpected tone'; % Label of x axis
cfg.yLabel  = '{\itCriterion} expected tone'; % Label of y axis

cfg.LowLim  = -.5;      % Lower bound of scale
cfg.HighLim = 2.5;       % Upper bound of scale

%cfg.MeanC   = [0, 179, 255]./255; % Color of mean dot
cfg.MeanC   = [1, 0, 0]; % Color of mean dot RED
%cfg.MeanC   = [1, .5, 0]; % Color of mean dot ORANGE
%cfg.MeanC   = [16, 183, 27]./255; % Color of mean dot GREEN

MainPlotting
