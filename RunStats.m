% d' of each condition
[m, ci] = MeanCI(data_exp);
fprintf('Expected tone: %.2f [%.2f, %.2f]',[m,ci])
fprintf('\r');

[m, ci] = MeanCI(data_une);
fprintf('Unexpected tone: %.2f [%.2f, %.2f]',[m,ci])
fprintf('\r');

ES = mes(data_exp',data_une','hedgesg','isDep',1);
ES.t.p = ES.t.p/2; % p value is one tailed

[m, ci] = MeanCI(data_exp-data_une);

s = [m,ci(1),ci(2),...
    ES.t.df,ES.t.tstat,ES.t.p,...
    ES.hedgesg,ES.hedgesgCi(1),ES.hedgesgCi(2)];

fprintf('Difference: %.2f [%.2f, %.2f]',s(1:3))
fprintf('\r\r');

if LaTeX
    % Output is formatted for LaTeX
    fprintf('\\textit{t}\\textsubscript{(%.0f)} = %.2f, \\textit{p} = %.2g, \\textit{g} = %.2f [%.2f, %.2f]',s(4:9));
    fprintf('\r');
else
    fprintf('t(%.0f) = %.2f, p = %.2g, g = %.2f [%.2f, %.2f]',s(4:9));
    fprintf('\r');
end

d   = (data_exp - data_une)>0;
hit = sum(d);
tot = length(d);

[r,ci] = binofit(hit,tot);
p      = myBinomTest(hit,tot,.5,'one');

if LaTeX
    % Output is formatted for LaTeX
    fprintf('\r');
    fprintf('%.2f\\%% [%.2f\\%%, %.2f\\%%], or %.0f out of %.0f, one-sided binomial test: \\textit{p} = %.2g',[r*100,ci.*100,hit,tot,p]);
    fprintf('\r');
else
    fprintf('\r');
    fprintf('%.2f%% [%.2f%%, %.2f%%], or %.0f out of %.0f, one-sided binomial test: p = %.2g',[r*100,ci.*100,hit,tot,p]);
    fprintf('\r');
end

BF = t1smpbf(ES.t.tstat,tot,.7071);
fprintf('BF for the null: %.2f',1/BF) 
fprintf('\r\r');