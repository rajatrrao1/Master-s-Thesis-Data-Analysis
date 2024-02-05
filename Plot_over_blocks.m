
P_exp = nan(10,12);
P_une = nan(10,12);
for b = 1:10
    [ D ] = GetPerformance( D, b );
    P_exp(b,:) = [D.dPrime_exp];
    P_une(b,:) = [D.dPrime_une];
end

figure; hold on
plot(mean(P_exp,2),'k')
plot(mean(P_une,2),'red')