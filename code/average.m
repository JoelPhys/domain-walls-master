clear all; 
close all;

% myDir = uigetdir; %gets directory
myDir(1) = "/home/sr4871/PhD/materials/mn2au/domain_walls/test4tom/run1";
myDir(2) = "/home/sr4871/PhD/materials/mn2au/domain_walls/test4tom/run2";
% myDir(3) = "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/run3/processed";
% myDir(4) = "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/run4/processed";
% myDir(5) = "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/run5/processed";

saveDir = "/home/sr4871/PhD/materials/mn2au/domain_walls/ASD/new_with_ani/test/";

figure;
hold on;
legend;

for j=100:100:1500
    
    num = num2str(j,"%04.f")

    for i=1:5
        
        myFile = strcat(myDir(i),"/ndw",num,".dat");
            
        tab = readtable(myFile);
        l(:,i) = table2array(tab(:,1));
        x(:,i) = table2array(tab(:,2));
        y(:,i) = table2array(tab(:,3));
        z(:,i) = table2array(tab(:,4));
        [numrows, numcols] = size(tab);
    end
    
    lmean = mean(l, 2);
    xmean = mean(x, 2);
    ymean = mean(y, 2);
    zmean = mean(z, 2);
    
    plot(lmean, xmean,'DisplayName',num);
    pause(0.1);
  
    writematrix([lmean xmean ymean zmean], strcat(saveDir,"test",num),'Delimiter',' ');
end