clc, clear all;

imagen = imread('Imagen.jpg');
A = rgb2gray(imagen);
A = double(A);
subplot(2,2,1);
title('IMAGEN ORIGINAL');
imshow(uint8(A));
[M,N] = size(A);

for i=1:M
    for j=1:N
       if(i==1&&j==1)
           B(i,j)=double(A(1,1));
       elseif(i~=1&&j==1)
               B(i,j)=double(A(i,j)-(A(i-1,N)));
       else

               B(i,j)=double(A(i,j)-A(i,j-1));
       end
       
    end
end

subplot(2,2,2);
title('IMAGEN DIFERENCIAL');
imshow(uint8(B));
C = uint8(B(:).');

bitImgDiferencial = de2bi(uint8(B));
numBitOrigen = numel(bitImgDiferencial);
fprintf('Número de bits antes de la codifación = %d \n',numBitOrigen);

valores = (0:1:255).';
count = histc(C, valores);
prob = count/sum(count);

diccionario = huffmandict (valores, prob);
archivoCodificado = huffmanenco (C, diccionario);
bitCodi = de2bi(archivoCodificado);
numbitCodi = numel(bitCodi);
fprintf('Número de bits luego de la codifación = %d \n',numbitCodi);

archivoDecodificado = huffmandeco (archivoCodificado, diccionario);
archivoDecodificado = reshape(archivoDecodificado,M,N);

for i=1:M
    for j=1:N
       if(i==1&&j==1)
           D(i,j)=double(A(1,1));
       elseif(i~=1&&j==1)
           D(i,j)=(B(i,j)+D(i-1,N));
       else
           D(i,j)=(B(i,j)+D(i,j-1));
       end
       
    end
end

img = reshape(archivoDecodificado,M,N);

radioCompre = numBitOrigen/numbitCodi;
fprintf(1,'El radio de compresion es: %f \n',radioCompre)
subplot(2,2,3)
title('IMAGEN CODIFICADA')
imshow(uint8(img))
subplot(2,2,4)
title('IMAGEN RECUPERADA');
imshow(uint8(D))
