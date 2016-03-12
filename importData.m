% Computational Finance CW2
list = dir('.\DATA\*.prn');

numArrays = 5;
optionC = cell(numArrays,1);
optionP = cell(numArrays,1);
for i = 1:numArrays
    pathC=['.\DATA\',list(i).name];
    optionC{i} = importdata(pathC);
    pathP=['.\DATA\',list(i+5).name];
    optionP{i} = importdata(pathP);
end






