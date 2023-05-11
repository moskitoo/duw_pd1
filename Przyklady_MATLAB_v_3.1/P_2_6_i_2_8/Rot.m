function R=Rot(fi)
% R=Rot(fi)
%   Obliczanie macierzy rotacji - przypadek p�aski (2x2)
% Wej�cie:
%   fi - kat fi (w radianach).
% Wyj�cie:
%   R - macierz kosinus�w kierunkowych.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

R=[cos(fi) -sin(fi);sin(fi) cos(fi)];

