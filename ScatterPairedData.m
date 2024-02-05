function [] = ScatterPairedData(cfg)

figure('Position',[100 100 500 500]); hold on


% Unpack all variables
fnames = fieldnames(cfg);

for f = 1:length(fnames)
    eval([fnames{f},' = cfg.',fnames{f},';']);
end

% Plot diagonal and zero lines
plot([LowLim,HighLim],[LowLim,HighLim],'k','LineWidth',1.5)
plot([LowLim,HighLim],[pointN,pointN],'k:','LineWidth',1)
plot([pointN,pointN],[LowLim,HighLim],'k:','LineWidth',1)

% Mean of conditions
Pos   = [mean(x) - s/2, mean(y) - s/2, s, s];
rectangle('Position',Pos,'Curvature',Shape,'EdgeColor',MeanC,'FaceColor',MeanC,'LineWidth',.9)

% Projection to the axis
Pop   = (HighLim-LowLim)/234;
Pos   = [mean(x) - s/2, LowLim+Pop - s/2, s, s];
rectangle('Position',Pos,'Curvature',Shape,'EdgeColor','none','FaceColor',MeanC)
Pos   = [LowLim+Pop - s/2, mean(y) - s/2, s, s];
rectangle('Position',Pos,'Curvature',Shape,'EdgeColor','none','FaceColor',MeanC)

% Individual dots
for p = 1:length(x)
    Pos   = [x(p) - s/2, y(p) - s/2, s, s];
    rectangle('Position',Pos,'Curvature',Shape,'EdgeColor',IndDotC,'FaceColor','none','LineWidth',.9) % Transparent dots
end

% Within subjects error bars. Normalization method, corrected
% following Morey2008
dnorm = [x;y] - mean([x;y]) + mean(mean([x;y]));
sem   = std(dnorm,0,2)/sqrt(length(dnorm))*sqrt(2);
ts    = tinv(1-a/2,length(x)-1);
CI1   = sem(1)*ts;
CI2   = sem(2)*ts;

Pos   = [mean(x)-CI1, mean(y)-CI2, CI1*2, CI2*2];
rectangle('Position',Pos,'Curvature',1,'EdgeColor','none','FaceColor',[MeanC, .3])

sem   = std(y,0,2)/sqrt(length(y));
plot([LowLim,LowLim]',[mean(y)-(sem(1)*ts),mean(y)+(sem(1)*ts)]','color',MeanC,'LineWidth',3)
sem   = std(x,0,2)/sqrt(length(x));
plot([mean(x)-(sem(1)*ts),mean(x)+(sem(1)*ts)]',[LowLim,LowLim]','color',MeanC,'LineWidth',3)

% Formating
xlabel(xLabel);
ylabel(yLabel);
set(gca, 'FontSize', 15,'XTick',round(LowLim):Step:round(HighLim),'YTick',round(LowLim):Step:round(HighLim),'LineWidth',1.5);
axis([LowLim HighLim LowLim HighLim]);
pbaspect([1 1 1]);