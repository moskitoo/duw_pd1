% Przyklad 1.7

x=2.3; % Przyblizenie startowe
W=[];  % Tablica do zapisu wynikow
eps=1e-10; % Dokladnosc rozwiazania
F=1;   % Podstawienie dowolnej liczby wiekszej od eps
iter=1;  
while ( (norm(F)>eps) && (iter < 25) )
    F=x^5-18*x^4+105*x^3-210*x^2+104*x-192; %Obliczanie funkcji
    Fx=5*x^4-72*x^3+315*x^2-420*x+104; %Obliczanie pochodnej
    x=x-F/Fx;    %Obliczanie kolejnego przyblizenia
    W(iter,:)=[iter F Fx x]; %Zapisywanie wynikow posrednich
    iter=iter+1;
end
disp('      i        f(xi)    fx(xi)     xi+1');
disp(W);   %Drukowanie wynikow
