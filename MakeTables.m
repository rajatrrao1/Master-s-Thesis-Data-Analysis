Fields = {'hit_exp', 'hit_une', 'miss_exp', 'miss_une', 'miss_na_exp', ...
    'miss_na_une', 'miss_na_omi', 'fa_exp', 'fa_une', 'fa', 'correg', ...
    'conf_une', 'conf_exp', 'dPrime_exp', 'dPrime_une', 'criterion_exp', 'criterion_une'};

clear T
for field = 1:length(Fields)
    eval([Fields{field} , ' = [D(:).', Fields{field}, '];']);
end

for field = 1:length(Fields)
    eval(['S.',Fields{field} , ' = [D.', Fields{field}, '];']);
end

%T.Names = Fields
%T = struct2table(T)

% Extract field names and values
field_names = fieldnames(S);
field_values = struct2cell(S);
field_values = cell2mat(field_values);

% Create a table
%T = table(round(field_values(:,1),2), round(field_values(:,2),2), 'VariableNames', {'S00', 'S01'});

T = table;
for s = 1:length(D)
    T = [T, table(round(field_values(:,s),2), 'VariableNames', {['S',num2str(s+13,'%02.f')]});];
end
T.Properties.RowNames = field_names;

% Display the table
disp(T);
writetable(T, TableName, 'WriteRowNames', true);
