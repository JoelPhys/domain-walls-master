clear all; 
close all;

% myDir = '/home/sr4871/PhD/materials/mn2au/domain_walls/shortrange_0_30_cutoff/run09/raw'
% myFiles = dir(fullfile(myDir,'dw_*.dat')); %gets all .dat files in struct

% Testing with multi LLB
myDir = '/home/sr4871/PhD/codes/Joel/LLB-multi-master'
myFiles = dir(fullfile(myDir,'test2.dat')); %gets all .dat files in struct

% a = 3.33e-10;
a = 2e-9;

figure;
hold on;
legend;
for k = 1:length(myFiles)
    
    
    fullpath = strcat(myDir,'/',myFiles(k).name)
    test = readtable(fullpath);
    test = table2array(test);
    [numrows, numcols] = size(test);

%     for j = 1:10:numrows
        count = 1;
        for i = 1:3:numcols
%             x(count) = test(j,i);
%             y(count) = test(j,i+1);
%             z(count) = test(j,i+2);
            x(count) = mean(test(900:end,i));
            y(count) = mean(test(900:end,i+1));
            z(count) = mean(test(900:end,i+2));
            o(count) = a*count - a;
            count = count+1;
        end
%         pause(0.1)
%         plot(o/1e-9,x) 
%     end
    plot(o/1e-9,x,'DisplayName',myFiles(k).name)
    pause(0.1)
    newStr = extractAfter(myFiles(k).name,"dw");
    
    
    newDir = extractBefore(myDir,"raw")
%     writematrix([o' x' y' z'], strcat(newDir,"/processed/ndw",newStr),'Delimiter',' ');
    writematrix([o' x' y' z'], strcat(myDir,"/dw2.dat"),'Delimiter',' ');

end