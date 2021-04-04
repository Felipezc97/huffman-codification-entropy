clear all;
close all; 
clc;
imagen= imread('imagen.png');
x= rgb2gray(imagen);
figure 
imshow(x)
figure(2), imhist(x)
histograma=imhist(x);
q=double(x); % transformar la imagen  a double 
histograma=histograma/sum(histograma);
histograma(find(histograma==0))=1; % busca valores en el rango de 0 a 1 dentro del histograma
loghistograma= log2(histograma);
H = - sum(histograma.*loghistograma) % fórmula de la entropía