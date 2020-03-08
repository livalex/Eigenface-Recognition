function task5(image, k)
  %TODO
  % Graficul 1
  [A_k S] = task3(image, k);
  figure(1);
  plot(diag(S));
  % Graficul 2
  rezultat = [];
  Size = size(diag(S));
  B = imread(image);
  A = double(B);
  vector = diag(S);
  [m, n] = size(A);
  val = 0;
  valoarea2 = 0;
  for i = 1 : min(m, n)
    val += vector(i);
  endfor
  [Z_k S_k] = task3(image,Size);
  vectorul2 = diag(S_k);
  for i = 1 : Size
    valoarea2 += vectorul2(i);
    rezultat(i) = valoarea2 / val;
  endfor
  figure(2);
  plot([1 : Size], rezultat);
  % Graficul 3
  val = [];
  for l = 1 : Size
    [A_k2 S2] = task3(image, l);
    diff = 0;
    mult = 1;
    s = 0;
    for i = 1 : 1 : m
      for j = 1 : 1 : n
        diff = A(i,j) - A_k2(i, j);
        mult = diff * diff;
        s += mult;
      endfor
    endfor
    val(l) = s;
  endfor
  figure(3);
  plot([1 : Size] , val / (m * n));
  % Graficul 4
  ratio = [];
  for i = 1 : Size
    ratio(i) = 2 * i + 1;
  endfor
  figure(3);
  plot([1 : Size], ratio / n);
end