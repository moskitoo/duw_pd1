% Przyklad 1.8

c=3; % Wymiar charakterystyczny mechanizmu
h=4; % Zadanna wartosc wspolrzednej
q=[4 pi/4]';  %Przyblizenie startowe
eps=1e-10; % Dokladnosc rozwiazania
F=ones(2,1);  % Wektor zlozony z dwoch jedynek
iter=1;  % Licznik iteracji
while ( (norm(F)>eps) && (iter < 25) )
    r=q(1); fi=q(2);   % Nadanie czytelnych nazw elementom wektora q
    F=[r*cos(fi)-c;
        r*sin(fi)-h];  % Wektor lewych stron ukladu rownan
    Fq=[cos(fi) -r*sin(fi);
        sin(fi) r*cos(fi)];  % Macierz Jacobiego
    q=q-Fq\F;  % Kolejna iteracja
    iter=iter+1;
end
q %Drukowanie wynikow
