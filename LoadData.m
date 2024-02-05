function [ D ] = LoadData( PathData )

ff = dir(fullfile(PathData,'*.mat'));

for s = 1:length(ff)
    load(fullfile(PathData,ff(s).name));
    
    D(s).resp = E.resp.mainTask.resp;
    
    % Flip responses of a participant that mistake the response keys
    if any(strcmp(ff(s).name(24:25),{'04','20','23'}))
        D(s).resp(D(s).resp == 1) = -2;
        D(s).resp(D(s).resp == 2) = -1;
        D(s).resp = abs(D(s).resp);
    end
    
    D(s).rt   = E.resp.mainTask.respTime;
    
    D(s).cond = E.lists.mainTask(1:size(E.resp.mainTask.resp,1),1:size(E.resp.mainTask.resp,2));
    
    D(s).age   = E.sbj.age;
    %D(s).gen   = E.sbj.sex;
end
end

