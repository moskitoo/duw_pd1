% Przyklad 1.5

x=1;   % Przyblizenie startowe
W=[];  % Tablica do zapisu wynikow
eps=1e-10; % Dokladnosc rozwiazania
F=1;   % Podstawienie dowolnej liczby wiekszej od eps
iter=1; % Licznik iteracji
while ( (norm(F)>eps) && (iter < 25) )
    F=x^2-2;     %Obliczanie funkcji
    Fx=2*x;      %Obliczanie pochodnej
    x=x-F/Fx;    %Obliczanie kolejnego przyblizenia
    W(iter,:)=[iter F Fx x]; %Zapisywanie wynikow posrednich
    iter=iter+1;
end
disp('      i        f(xi)    fx(xi)     xi+1');
disp(W);   %Drukowanie wynikow
