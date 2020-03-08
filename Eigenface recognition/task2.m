function task2(image)
   %TODO
   % Graficul 1
   % Citim imaginea
   B = imread(image);
   A = double(B);
   % Vector de valori singulare.
   S = svd(A);
   figure(1);
   plot(S);
   % Graficul 2
   % Numarul de valori singulare
   Size = size(svd(A));
   % Citim A_k de la task1
   A_k = task1(image, Size);
   S_k = svd(A_k);
   [m, n] = size(A);
   val = 0;
   % Adunam toate valorile singulare pana la minimul dintre m si n.
   for i = 1 : min(m,n);
     val += S(i);
   endfor
   vector = [];
   val2 = 0;
   % Face suma primului elem,al primelor 2,al primelor 3 si tot asa.
   % Apoi imparte fiecare rezultat la suma tuturor val singulare si
   % Le pune in vectorul vector.
   for i = 1 : Size
     val2 += S_k(i);
     vector(i) = val2 / val;
   endfor
   figure(2);
   plot([1:Size],vector);
   % Graficul 3
   val = [];
   % Graficul se contureaza pt toate valorile lui k(Size).
   for l = 1 : Size
     % Cititim imaginea
     A_k2 = task1(image, l);
     diff = 0;
     mult = 1;
     s = 0;
   for i = 1 : 1 : m
     for j = 1 : 1 : n
        diff = A(i,j) -  A_k2(i,j);
        mult = diff * diff;
       s += mult;
     endfor
   endfor
   % Stocam valorile formulei aplicate pt fiecare k in val.
   val(l) = s;
   endfor
   figure(3);
   plot([1:Size],val / (m * n));
   % Graficul 4
   ratio = [];
   for i = 1 : Size 
    ratio(i) = (m * i + n * i + i);
   endfor
   figure(4);
   plot([1:Size], ratio/ (m*n));
end