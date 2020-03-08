function [A_k S] = task3(image, k)
  %TODO
  % Citim imaginea(valorile pixelilor care sunt double)
  B = imread(image);
  A = double(B);
  [m, n] = size(A);
  u = zeros(m, 1);
  for i = 1 : m
    u(i) = mean(A(i,:));
    A(i,:) -= u(i); 
  endfor
  Z = ones(n,m);
  Z = A' / sqrt(n - 1);
  [U, S, V] = svd(Z);
  W = ones(m,k);
  for i = 1 : k
    W(:,i) = V(:,i);
  endfor
  Y = ones(k,n);
  Y = W' * A;
  A_k = W * Y + u;
endfunction