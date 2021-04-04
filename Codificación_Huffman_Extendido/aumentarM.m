function [nProb] = aumentarM(prob,simbolos,m,probAnte)%aumenta una combinacion mas a los simbolos y probabilidades

probaAux=[];
nProb=probAnte;
nSimbol=numel(simbolos);
n=numel(probAnte);
if(m>1)%si m=1, el codigo es el mismo
            nSimbolN=nSimbol.^m;%siempre va a ser 2^m en este caso
            num=1;
            probaAux=[];
            for i=1:n
                for j=1:nSimbol%lazo realizara todas las posibles combinaciones al aumentar M
                aux=nProb(i)*prob(j);%calculo y guardo las probabilidades
                
                probaAux(num)=aux;
                num=num+1;
                end
            end
            nProb=probaAux;
else
    nProb=prob;
end

%display(probaAux)
end