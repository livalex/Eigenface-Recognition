function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  L = double(rgb2gray(imread(image_path)));
  lines = size(L,1);
  columns = size(L,2);
  L = reshape(L, lines * columns, 1);
  A = L - m;
  pr_test_img = eigenfaces' * A;
  n = [];
  % distanta dintre doi vec e norma din diferenta lor.
  for i = 1 : 1 : size(pr_img,2)
      n = [n, norm(pr_img(:,i) - pr_test_img)];
  endfor
  [min_dist output_img_index] = min(n);
end