clc, clear all;

%PARA m=1
simbolos = [1,2];
prob = [0.9 , 0.1];
cod1 = huffmandict(simbolos,prob);
longM1 = longitudMed(prob,cod1(:,2));

%PARA m=2
simb2 = calculoSimb(2^2);
prob2 = aumentarM(prob,simbolos,2,prob);
cod2 = huffmandict(simb2,prob2);
longM2 = longitudMed(prob2,cod2(:,2));


%PARA m=3
simb3 = calculoSimb(2^3);
prob3 = aumentarM(prob,simbolos,2,prob2);
cod3 = huffmandict(simb3,prob3);
longM3 = longitudMed(prob3,cod3(:,2));

%PARA m=4
simb4 = calculoSimb(2^4);
prob4 = aumentarM(prob,simbolos,2,prob3);
cod4 = huffmandict(simb4,prob4);
longM4 = longitudMed(prob4,cod4(:,2));

%PARA m=5
simb5 = calculoSimb(2^5);
prob5 = aumentarM(prob,simbolos,2,prob4);
cod5 = huffmandict(simb5,prob5);
longM5 = longitudMed(prob5,cod5(:,2));

%PARA m=6
simb6 = calculoSimb(2^6);
prob6 = aumentarM(prob,simbolos,2,prob5);
cod6 = huffmandict(simb6,prob6);
longM6 = longitudMed(prob6,cod6(:,2));

%PARA m=7
simb7 = calculoSimb(2^7);
prob7 = aumentarM(prob,simbolos,2,prob6);
cod7 = huffmandict(simb7,prob7);
longM7 = longitudMed(prob7,cod7(:,2));


%PARA m=8
simb8 = calculoSimb(2^8);
prob8 = aumentarM(prob,simbolos,2,prob7);
cod8 = huffmandict(simb8,prob8);
longM8 = longitudMed(prob8,cod8(:,2));

%PARA m=9
simb9 = calculoSimb(2^9);
prob9 = aumentarM(prob,simbolos,2,prob8);
cod9 = huffmandict(simb9,prob9);
longM9 = longitudMed(prob9,cod9(:,2));

%Grafica m vs Longitud media
figure()
m = [1,2,3,4,5,6,7,8,9];
lonMedia = [longM1/1,longM2/2,longM3/3,longM4/4,longM5/5,longM6/6,longM7/7,longM8/8,longM9/9]
plot(m,lonMedia,'--b*')
title('Grafica m vs Longitud media')
xlabel('m')
ylabel('Longitud media')
grid on