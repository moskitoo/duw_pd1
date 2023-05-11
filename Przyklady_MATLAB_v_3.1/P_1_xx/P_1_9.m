% Przyklad 1.8

c=3; % Wymiar charakterystyczny mechanizmu
r=4; % Zadana wartosc wspolrzednej
q=[pi/4 1]';  %Przyblizenie startowe
eps=1e-10; % Dokladnosc rozwiazania
F=ones(2,1);  % Wektor zlozony z dwoch jedynek
iter=1;  % Licznik iteracji
while ( (norm(F)>eps) && (iter < 25) )
    fi=q(1); h=q(2);   % Nadanie czytelnych nazw elementom wektora q
    F=[r*cos(fi)-c;
        r*sin(fi)-h];  % Wektor lewych stron ukladu rownan
    Fq=[-r*sin(fi) 0;
        r*cos(fi) -1];  % Macierz Jacobiego
    q=q-Fq\F;  % Kolejna iteracja
    iter=iter+1;
end
q %Drukowanie wynikow
