function [lonM] = longitudMed(prob,cod)
lon =0;
for i=1 : length(cod)
    lon = lon +(prob(i)* length(cell2mat(cod(i))));
end
lonM = lon;
end