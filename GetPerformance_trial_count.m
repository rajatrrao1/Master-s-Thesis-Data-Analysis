function [ D ] = GetPerformance_trial_count( D )

for n = 1:length(D)
    
    % All in vector form
    resp = D(n).resp(:,11:end);
    resp = resp(:);
    rt   = D(n).rt(:,11:end);
    rt = rt(:);
    cond  = D(n).cond(:,11:end);
    cond = cond(:);
    
    %% Classify trials according to condition and response
    
    % Hits
    hit_exp1 = sum(cond == 1 & resp == 1);
    hit_exp2 = sum(cond == 2 & resp == 2);
    D(n).hit_exp  = (hit_exp1 + hit_exp2);
    
    hit_une1 = sum(cond == 3 & resp == 2);
    hit_une2 = sum(cond == 4 & resp == 1);
    D(n).hit_une  = (hit_une1 + hit_une2);
    
    % Miss
    miss_exp1 = sum(cond == 1 & resp == 3);
    miss_exp2 = sum(cond == 2 & resp == 3);
    D(n).miss_exp  = (miss_exp1 + miss_exp2);
    
    miss_une1 = sum(cond == 3 & resp == 3);
    miss_une2 = sum(cond == 4 & resp == 3);
    D(n).miss_une  = (miss_une1 + miss_une2);
    
    % Miss no answer
    miss_na_exp1 = sum(cond == 1 & resp == 0);
    miss_na_exp2 = sum(cond == 2 & resp == 0);
    D(n).miss_na_exp  = (miss_na_exp1 + miss_na_exp2);
    
    miss_na_une1 = sum(cond == 3 & resp == 0);
    miss_na_une2 = sum(cond == 4 & resp == 0);
    D(n).miss_na_une  = (miss_na_une1 + miss_na_une2);
    
    miss_na_omi1 = sum(cond == 5 & resp == 0);
    miss_na_omi2 = sum(cond == 6 & resp == 0);
    D(n).miss_na_omi  = (miss_na_omi1 + miss_na_omi2);
    
    % False Alarms
    fa_exp1 = sum(cond == 5 & resp == 1);
    fa_exp2 = sum(cond == 6 & resp == 2);
    D(n).fa_exp  = (fa_exp1 + fa_exp2);
    
    fa_une1 = sum(cond == 5 & resp == 2);
    fa_une2 = sum(cond == 6 & resp == 1);
    D(n).fa_une  = (fa_une1 + fa_une2);
    
    fa = sum((cond == 5 | cond == 6) & (resp == 1 | resp == 2));
    D(n).fa = fa;
    
    % CorReg
    correg1  = sum(cond == 5 & resp == 3);
    correg2  = sum(cond == 6 & resp == 3);
    D(n).correg  = (correg1 + correg2);
    
    % Confusions
    conf_une1 = sum(cond == 1 & resp == 2);
    conf_une2 = sum(cond == 2 & resp == 1);
    D(n).conf_une  = (conf_une1 + conf_une2);
    
    conf_exp1 = sum(cond == 3 & resp == 1);
    conf_exp2 = sum(cond == 4 & resp == 2);
    D(n).conf_exp  = (conf_exp1 + conf_exp2);
end