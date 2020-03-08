function [A_k S] = task4(image, k)
 B = imread(image);
  A = double(B);
  [m, n] = size(A);
  u = zeros(m, 1);
  for i = 1 : m
    u(i) = mean(A(i,:));
    A(i,:) -= u(i); 
  endfor
  Z = A*(A'/(n-1));
  [V S] = eig(Z);
  W = ones(m,k);
  for i = 1 : k
    W(:,i) = V(:,i);
  endfor
  Y = ones(k,n);
  Y = W' * A;
  A_k = W * Y + u;
endfunction