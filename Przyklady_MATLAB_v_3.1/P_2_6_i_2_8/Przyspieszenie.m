function d2q=Przyspieszenie(dq,q,t)
% d2q=Przyspieszenie(dq,q,t)
%   Procedura do rozwi�zywania zadania o przyspieszeniu.
%   Zadania o po�o�eniu i pr�dko�ci musz� by� rozwi�zane wcze�niej.
% Wej�cie:
%   dq - pochodne wsp�rz�dnych absolutnych wzgl�dem czasu,
%   q  - wsp�rz�dne absolutne uk�adu wielocz�onowego,
%   t  - chwila, dla kt�rej poszukiwane jest rozwi�zanie.
% Wyj�cie:
%   d2q - obliczone drugie pochodne wsp�rz�dnych absolutnych wzgl�dem czasu.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

Dane; % Wczytanie danych o wymiarach mechanizmu i usytuowaniu par kinematycznych

% Przypisanie elementom wektora q czytelnych nazw
r1=q(1:2); fi1=q(3);   r2=q(4:5); fi2=q(6);  r3=q(7:8); fi3=q(9);

% Obliczenie macierzy kosinus�w kierunkowych
Rot1=Rot(fi1);  Rot2=Rot(fi2);  Rot3=Rot(fi3);

% Przypisanie elementom wektora dq czytelnych nazw
dfi1=dq(3);   dfi2=dq(6);   dfi3=dq(9);

% Obliczenie wektora prawych stron
gam(1:2,1)=-Rot1*sB1*dfi1^2;
gam(3:4,1)=Rot1*sA1*dfi1^2-Rot2*sB2*dfi2^2;
gam(5:6,1)=Rot2*sA2*dfi2^2-Rot3*sB2*dfi2^2;
gam(7,1)=0;
gam(8,1)=-v0'*Rot3*sA3*dfi3^2;
gam(9,1)=2;

% Obliczenie macierzy uk�adu r�wna�
Fq=Jakobian(q);

% Obliczenie przyspieszenia (rozwi�zanie uk�adu r�wna�)
d2q=Fq\gam; 
