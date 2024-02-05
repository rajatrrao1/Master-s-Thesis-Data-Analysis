%%

cfg.a       = .05; % Alpha use for confident intervals

cfg.Step    = 1;       % Step of the scale
cfg.pointN  = 0;

cfg.IndDotC = [0 0 0]; % Color of individual dots

cfg.s       = .15;     % Size of dots (use .15)
cfg.Shape   = 1;       % 1 for circle, 0 for square

%figure('Position',[100 100 500 500]); hold on
ScatterPairedData(cfg);

l = [min(cfg.x),max(cfg.x),min(cfg.y),max(cfg.y)];
% min(l)
% max(l)
