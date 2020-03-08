function A_k = task1(image, k)
  %TODO
  % Citim imaginea(valorile pixelilor care sunt double)
  B = imread(image);
  A = double(B);
  % Dimens lui A
  [m, n] = size(A);
  % SVD
  [U, S, V] = svd(A);
  U_k = resize(U, m, k);
  S_k = resize(S, k, k);
  V_k = resize(V, n, k);
  A_k = U_k * S_k * V_k';
end