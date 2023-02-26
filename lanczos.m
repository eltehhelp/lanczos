function [x,y] = lanczos(A, v1)
n = length(A) %% размер матрицы
v2 = 0; %% начальные значения
beta = 0; %% начальные значения
for i = 1:n
    w = dot(A, diag(v1));
    conj1 = conj(w);
    alpha = dot(conj1, v1);
    w = diag(diag(w) - diag(alpha * v1) - diag(beta * v2));
    beta = norm(w);
    x(i) = norm(alpha);
    if i < (n) %% исключаю последний элемент
       y(i) = beta; 
    end
     v2 = v1;
     v1 = w/beta;    
end

end

