function F=Wiezy(q,t)
% F=Wiezy(q,t)
%   Procedura wspó³pracuj¹ca z NewRaph.
%   S³u¿y do obliczania wartoœci funkcji opisuj¹cych wiêzy.
% Wejœcie:
%   q - wspó³rzêdne absolutne uk³adu wielocz³onowego,
%   t - aktualna chwila.
% Wyjœcie:
%   F - wartoœci funkcji.
%
%*************************************************************
%   Program stanowi za³¹cznik do ksi¹¿ki:
%   Fr¹czek J., Wojtyra M.: Kinematyka uk³adów wielocz³onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

Dane; % Wczytanie danych o wymiarach mechanizmu i usytuowaniu par kinematycznych

% Przypisanie elementom wektora q czytelnych nazw
r1=q(1:2); fi1=q(3);   r2=q(4:5); fi2=q(6);   r3=q(7:8);   fi3=q(9);

% Obliczenie macierzy kosinusów kierunkowych
Rot1=Rot(fi1);   Rot2=Rot(fi2);   Rot3=Rot(fi3);

% Równania wiêzów
F(1:2,1)=sA0-(r1+Rot1*sB1);
F(3:4,1)=r1+Rot1*sA1-(r2+Rot2*sB2);
F(5:6,1)=r2+Rot2*sA2-(r3+Rot3*sB3);
F(7,1)=fi3-f0;
F(8,1)=v0'*(sB0-r3-Rot3*sA3);
F(9,1)=fi1-t^2-pi/2;

