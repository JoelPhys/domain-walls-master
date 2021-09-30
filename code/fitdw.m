close all;
clear all;

% Folder and directory
% myDir = '/home/sr4871/PhD/materials/mn2au/domain_walls/shortrange_0_30_cutoff/run10/processed';
% myFiles = dir(fullfile(myDir,'*.dat'));

myDir = '/home/sr4871/PhD/codes/Joel/LLB-multi-master';
myFiles = dir(fullfile(myDir,'dw2.dat'));

for k = 1:length(myFiles)
    
%      myFiles(k).name
%      temp = extractBetween(myFiles(k).name,"T_",".dat");
%      T(k) = str2double(temp);
    
    % Read file
    fullpath = strcat(myDir,'/',myFiles(k).name);
    test = readtable(fullpath);
    test = table2array(test);    
    x = test(:,1);
    m = test(:,2);
    
    [fitresult, gof] = tanhfit(x, m)
    hold on;
%     title(temp)
    hold off;
    what(k,:) = coeffvalues(fitresult);
end

% writematrix([T' what], "/home/sr4871/PhD/materials/mn2au/domain_walls/shortrange_0_30_cutoff/run10/fit.dat",'Delimiter',' ');