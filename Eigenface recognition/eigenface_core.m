function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  T = [];
  for j = 1 : 1 : 10
    L = double(rgb2gray(imread(strcat(database_path, '/', int2str(j), ".jpg"))));
    lines = size(L,1);
    columns = size(L,2);
    L = reshape(L, lines * columns, 1); % creem vec coloana
    T(:,j) = L; % Punem vec L ca si coloana J a matricii T.
   endfor
   m = [];
   aux = [];
   m = mean(T'); % means face ma pe coloane. Deci transpunem matr T.
   m = m'; % Ne trebuie pt a putea scadea din fiecare coloana a lui T vec m
   A = T - m; %scade vectorul coloana m din fiec coloana a matricii T
   [V D] = eig(A' * A); % D are pe diag prin val proprii iar V are pe col vect de val prop corespb fiec elem din D
   [x y] = size(D);
   for i = 1 : 1 : y
    if D(i,i) > 1
      aux = [aux,V(:,i)]; % pune pe fiecare coloana din aux coloana corespunzatoare din V daca valoarea proprie >1
    endif
   endfor
   V = aux;
   eigenfaces = A * V;
   pr_img = eigenfaces' * A;
endfunction