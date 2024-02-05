close all
% initialise a new figure with a white background
fig = figure('color', 'w');

% first plot just shows the raw data from each staircase and the thresholds
% that were calculated. Should probably find a nicer way to do this.

hold on; box on; set(gca, 'FontSize', 8);
%subplot(1,2,1); hold on; box on; set(gca, 'FontSize', 8);

% just using the values used in the simulation
ylim([0 .5]);

% loop through all staircases
whichStair = 2;
data = E.staircase.stimulusLevels(whichStair,:);
tn = 1:length(data);
% plot the normal values in black
p(1) = plot(tn, data, ...
    '-ko', 'MarkerSize', 3, 'MarkerFaceColor', 'k');

% plot the "incorrect" values in red
f = diff(E.staircase.stimulusLevels(whichStair,:))>0;

p(2) = plot(tn(f), data(f), ...
    'ro', 'MarkerSize', 3, 'MarkerFaceColor', 'r');

% plot the reversals
% p(3) = gridxy(sc.stairs(i).reversal(:,1), [], 'LineStyle', ':', 'Color', [0.8 0.8 0.8]);

% gather the individual thresholds
%thresholds = [ thresholds; sc.stairs(i).threshold ];

% draw the final threshold and individual thresholds
%p(4) = gridxy([], sc.threshold, 'color', 'r', 'linewidth', 1.5);
%p(5) = gridxy([], thresholds, 'color', 'r', 'LineStyle', ':');

% labels and title
xlabel('Trial number', 'fontsize', 14);
ylabel('Stimulus values', 'fontsize', 14);
title('Raw data', 'fontsize', 14)

print('stair','-dpng')
