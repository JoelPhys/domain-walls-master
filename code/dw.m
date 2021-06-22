clear all; 
close all;

test = readtable('../LLG-master/output/magnetisation/dw_T_1500.dat');
test = table2array(test);

a = 6.29e-10;
count = 1;

for j = 1:50
    count = 1;
    for i = 1:3:length(test)
        x(count) = test(j,i);
        y(count) = test(j,i+1);
        z(count) = test(j,i+2);
        o(count) = a*count - a;
%         xnew(count) = x(count)+o(count);
        count = count+1;
    end
    
%     plot3(x,y,z)
%     pause(0.1)
    
end
writematrix([o' x'], 'dw1500.dat','Delimiter',' ');