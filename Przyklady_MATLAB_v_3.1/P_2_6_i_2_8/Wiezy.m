function F=Wiezy(q,t)
% F=Wiezy(q,t)
%   Procedura wsp�pracuj�ca z NewRaph.
%   S�u�y do obliczania warto�ci funkcji opisuj�cych wi�zy.
% Wej�cie:
%   q - wsp�rz�dne absolutne uk�adu wielocz�onowego,
%   t - aktualna chwila.
% Wyj�cie:
%   F - warto�ci funkcji.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

Dane; % Wczytanie danych o wymiarach mechanizmu i usytuowaniu par kinematycznych

% Przypisanie elementom wektora q czytelnych nazw
r1=q(1:2); fi1=q(3);   r2=q(4:5); fi2=q(6);   r3=q(7:8);   fi3=q(9);

% Obliczenie macierzy kosinus�w kierunkowych
Rot1=Rot(fi1);   Rot2=Rot(fi2);   Rot3=Rot(fi3);

% R�wnania wi�z�w
F(1:2,1)=sA0-(r1+Rot1*sB1);
F(3:4,1)=r1+Rot1*sA1-(r2+Rot2*sB2);
F(5:6,1)=r2+Rot2*sA2-(r3+Rot3*sB3);
F(7,1)=fi3-f0;
F(8,1)=v0'*(sB0-r3-Rot3*sA3);
F(9,1)=fi1-t^2-pi/2;

