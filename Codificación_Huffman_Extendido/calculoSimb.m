function [simb] = calculoSimb(num)
aux = 1;
for i=1 :num
    simbAux(i) = aux;
    aux = aux +1;
end
simb = simbAux;

end