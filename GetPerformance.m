function [ D ] = GetPerformance( D, Block )


for n = 1:length(D)
    
    % All in vector form
    resp = D(n).resp(Block,11:end);
    resp = resp(:);
    rt   = D(n).rt(Block,11:end);
    rt = rt(:);
    cond  = D(n).cond(Block,11:end);
    cond = cond(:);
    
    %% Classify trials according to condition and response
    
    % Hits
    hit_exp1 = sum(cond == 1 & resp == 1)/sum(cond == 1);
    hit_exp2 = sum(cond == 2 & resp == 2)/sum(cond == 2);
    D(n).hit_exp  = (hit_exp1 + hit_exp2)/2;
    
    hit_une1 = sum(cond == 3 & resp == 2)/sum(cond == 3);
    hit_une2 = sum(cond == 4 & resp == 1)/sum(cond == 4);
    D(n).hit_une  = (hit_une1 + hit_une2)/2;
    
    % Miss
    miss_exp1 = sum(cond == 1 & resp == 3)/sum(cond == 1);
    miss_exp2 = sum(cond == 2 & resp == 3)/sum(cond == 2);
    D(n).miss_exp  = (miss_exp1 + miss_exp2)/2;
    
    miss_une1 = sum(cond == 3 & resp == 3)/sum(cond == 3);
    miss_une2 = sum(cond == 4 & resp == 3)/sum(cond == 4);
    D(n).miss_une  = (miss_une1 + miss_une2)/2;
    
    % Miss no answer
    miss_na_exp1 = sum(cond == 1 & resp == 0)/sum(cond == 1);
    miss_na_exp2 = sum(cond == 2 & resp == 0)/sum(cond == 2);
    D(n).miss_na_exp  = (miss_na_exp1 + miss_na_exp2)/2;
    
    miss_na_une1 = sum(cond == 3 & resp == 0)/sum(cond == 3);
    miss_na_une2 = sum(cond == 4 & resp == 0)/sum(cond == 4);
    D(n).miss_na_une  = (miss_na_une1 + miss_na_une2)/2;
    
    miss_na_omi1 = sum(cond == 5 & resp == 0)/sum(cond == 5);
    miss_na_omi2 = sum(cond == 6 & resp == 0)/sum(cond == 5);
    D(n).miss_na_omi  = (miss_na_omi1 + miss_na_omi2)/2;
    
    % False Alarms
    fa_exp1 = sum(cond == 5 & resp == 1)/sum(cond == 5);
    fa_exp2 = sum(cond == 6 & resp == 2)/sum(cond == 6);
    D(n).fa_exp  = (fa_exp1 + fa_exp2)/2;
    
    fa_une1 = sum(cond == 5 & resp == 2)/sum(cond == 5);
    fa_une2 = sum(cond == 6 & resp == 1)/sum(cond == 6);
    D(n).fa_une  = (fa_une1 + fa_une2)/2;
    
    fa = sum((cond == 5 | cond == 6) & (resp == 1 | resp == 2))/sum((cond == 5 | cond == 6));
    D(n).fa = fa;
    
    % CorReg
    correg1  = sum(cond == 5 & resp == 3)/sum(cond == 5);
    correg2  = sum(cond == 6 & resp == 3)/sum(cond == 6);
    D(n).correg  = (correg1 + correg2)/2;
    
    % Confusions
    conf_une1 = sum(cond == 1 & resp == 2)/sum(cond == 1);
    conf_une2 = sum(cond == 2 & resp == 1)/sum(cond == 2);
    D(n).conf_une  = (conf_une1 + conf_une2)/2;
    
    conf_exp1 = sum(cond == 3 & resp == 1)/sum(cond == 3);
    conf_exp2 = sum(cond == 4 & resp == 2)/sum(cond == 4);
    D(n).conf_exp  = (conf_exp1 + conf_exp2)/2;
    
    %assert((fa_exp1+fa_exp2 + fa_une1+fa_une2 + correg1+correg2 + miss_na_omi1+miss_na_omi2)/2 == 1)
    %%
    % As HitRates and FalseAlarms of 1 or 0 produce dPrimes of Inf and -Inf
    % respectively, cap performance to (n-1)/n
    
    n_exp = sum(cond == 1) + sum(cond == 2);
    if D(n).hit_exp == 1; D(n).hit_exp = (n_exp-1)/n_exp; end
    if D(n).hit_exp == 0; D(n).hit_exp = 1/n_exp; end
    
    n_une = sum(cond == 3) + sum(cond == 4);
    if D(n).hit_une == 1; D(n).hit_une = (n_une-1)/n_une; end
    if D(n).hit_une == 0; D(n).hit_une = 1/n_une; end
    
    n_omi = sum(cond == 5) + sum(cond == 6);
    if D(n).fa_exp == 1; D(n).fa_exp = (n_omi-1)/n_omi; end
    if D(n).fa_exp == 0; D(n).fa_exp = 1/n_omi; end
    if D(n).fa_une == 1; D(n).fa_une = (n_omi-1)/n_omi; end
    if D(n).fa_une == 0; D(n).fa_une = 1/n_omi; end
    if D(n).fa == 1; D(n).fa = (n_omi-1)/n_omi; end
    if D(n).fa == 0; D(n).fa = 1/n_omi; end
    
    % dPrime
    D(n).dPrime_exp    = norminv(D(n).hit_exp) - norminv(D(n).fa_exp);
    D(n).dPrime_une    = norminv(D(n).hit_une) - norminv(D(n).fa_une);
    
    % Criterion
    D(n).criterion_exp = -.5*(norminv(D(n).hit_exp) + norminv(D(n).fa_exp));
    D(n).criterion_une = -.5*(norminv(D(n).hit_une) + norminv(D(n).fa_une));
    
    % Reaction times
    D(n).rt_exp = nanmedian(rt(cond == 1 | cond == 2));
    D(n).rt_une = nanmedian(rt(cond == 3 | cond == 4));
    D(n).rt_omi = nanmedian(rt(cond == 5 | cond == 6));
end