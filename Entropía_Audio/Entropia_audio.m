clear all
clc
audio=audioread('Audio.mp3');%almaceno el audio mp3 en la variable audio, se forma mattriz mx2 debido a canal R-L
audio=audio(:);%se colocan los datos en forma de vector de una columna
audio=sort(audio);%ordenamiento del vector
audio=audio';%se colocan datos ordenados en un vecto de una fila
vu=unique(audio,'stable');%
for i=1:length(vu)%conteo de valores repetidos
    m=vu(i);
    nv(i)=length(find(audio==vu(i)));
end
%CALCULO DE ENTROPIA
tamanio=length(audio);
entropia=0;
for i=1:length(nv)
     probabilidad=nv(i)/tamanio;%calculo de probabilidades
     entropia=entropia+(probabilidad*(-(log10(probabilidad)/log10(2))));
end
              fprintf('La entropía del archivo de audio es: %f bits/símbolo \n',entropia);


