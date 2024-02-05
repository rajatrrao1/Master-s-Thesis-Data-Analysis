%% Hit rates

% Mean hit rates
expectedToneMean = 0.74;
unexpectedToneMean = 0.67;

% Error bars (standard deviation)
expectedToneError = (0.91 - 0.57) / 2; % Half the range for error bars
unexpectedToneError = (0.82 - 0.53) / 2; % Half the range for error bars

% X-axis positions for each group
x = [1, 2];

% Plotting
figure;

% Plot the first bar
bar1 = bar(x(1), expectedToneMean, 'FaceColor', [0.2, 0.6, 0.8]); % Blue color
hold on;

% Plot the second bar
bar2 = bar(x(2), unexpectedToneMean, 'FaceColor', [0.8, 0.4, 0.2]); % Red color

% Error bars
errorbar(x, [expectedToneMean, unexpectedToneMean], [expectedToneError, unexpectedToneError], 'k.', 'linewidth', 1.5);

% Labels
set(gca, 'xtick', x, 'xticklabel', {'Expected Tone', 'Unexpected Tone'});
ylabel('Mean Hit Rate in %');
title('Comparison of Mean Hit Rates');

% Show grid
grid on;

% Show plot
hold off;

%% False Alarms

% False alarm rates
expectedToneFalseAlarm = 0.12;
unexpectedToneFalseAlarm = 0.07;

% Error bars (standard deviation)
expectedToneError = 0.20 - 0.04; % Half the range for error bars
unexpectedToneError = 0.15 - (-0.00); % Half the range for error bars

% X-axis positions for each group
x = [1, 2];

% Plotting
figure;

% Plot the first bar for Expected Tone
bar1 = bar(x(1), expectedToneFalseAlarm, 'FaceColor', [0.2, 0.6, 0.8]); % Blue color
hold on;

% Plot the second bar for Unexpected Tone
bar2 = bar(x(2), unexpectedToneFalseAlarm, 'FaceColor', [0.8, 0.4, 0.2]); % Red color

% Error bars
errorbar(x, [expectedToneFalseAlarm, unexpectedToneFalseAlarm], [expectedToneError/2, unexpectedToneError/2], 'k.', 'linewidth', 1.5);

% Labels
set(gca, 'xtick', x, 'xticklabel', {'Expected Tone', 'Unexpected Tone'});
ylabel('False Alarm Rate in %');
title('Comparison of False Alarm Rates');

% Show grid
grid on;

% Show plot
hold off;

