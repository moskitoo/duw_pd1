function dq=Predkosc(q,t)
% dq=Predkosc(q,t)
%   Procedura do rozwi�zywania zadania o pr�dko�ci.
%   Zadanie o po�o�eniu musi by� rozwi�zane wcze�niej.
% Wej�cie:
%   q - wsp�rz�dne absolutne uk�adu wielocz�onowego,
%   t - chwila, dla kt�rej poszukiwane jest rozwi�zanie.
% Wyj�cie:
%   dq - obliczone pochodne wsp�rz�dnych absolutnych wzgl�dem czasu.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

% Prawa strona uk�adu r�wna� liniowych - pochodne wi�z�w wzgl�dem czasu.
Ft=[zeros(8,1);-2*t];

% Macierz uk�adu r�wna�
Fq=Jakobian(q);

% Obliczenie pr�dko�ci
dq=-Fq\Ft;
