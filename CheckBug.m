
PathData   = fullfile(pwd,'Data', 'Bug data'); % Data path
NoAnsLimit = .2;                   % Max allowed percentage of missing answers for each conditions

ff = dir(fullfile(PathData,'*.mat'));

for s = 1:length(ff)
    load(fullfile(PathData,ff(s).name));


    S(s) = mean(abs(diff(E.stim.tone_pairs(1,(end-200:end))))) > mean(abs(diff(E.stim.tone_pairs(2,(end-200:end)))));

end