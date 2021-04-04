clc, clear all

imagenGris = imread('1.jpg');
subplot(1,2,1)
imshow(imagenGris);
[M,N] = size(imagenGris);
A = imagenGris(:).';
sinComprimir = de2bi(imagenGris);
numBitsOrigen = numel(sinComprimir);
fprintf('Número de bits sin codificar: %d \n',numBitsOrigen);

valores = (0:1:255).';
count = histc(A, valores);
prob = count/sum(count);

diccionario = huffmandict (valores, prob);
archivoCodificado = huffmanenco (A, diccionario);
comprimido = de2bi(archivoCodificado);
numBitsCompress = numel(comprimido);
fprintf('Número de bits luego de codificar: %d \n',numBitsCompress);
archivoDecodificado = huffmandeco (archivoCodificado, diccionario);
if(isequal (A, archivoDecodificado))
    disp('Las imagenes a la entrada y a la salida son iguales no existe perdida')
end
imgenDecodificada = reshape(archivoDecodificado,M,N);
subplot(1,2,2)
imshow(uint8(imgenDecodificada))