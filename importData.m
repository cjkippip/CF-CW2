% Computational Finance CW2
list = dir('./DATA/*.prn');

numArrays = 5;
optionC = cell(numArrays,1);
optionP = cell(numArrays,1);
optionCPrice=ones(222,5);
optionPPrice=ones(222,5);
for i = 1:numArrays
    pathC=['./DATA/',list(i).name];
    optionC{i} = importdata(pathC);
    pathP=['./DATA/',list(i+5).name];
    optionP{i} = importdata(pathP);
    
    optionCPrice(:,i) = optionC{i}(:,2);
    optionPPrice(:,i) = optionP{i}(:,2);
end

stockPrice=optionC{1}(:,3);





