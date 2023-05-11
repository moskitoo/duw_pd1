function [T,Q,DQ,D2Q]=KorbWodz()
% [T,Q,DQ,D2Q]=KorbWodz
% Rozwi�zanie zada� kinematyki o po�o�eniu, pr�dko�ci i przyspieszeniu 
%   dla mechanizmu korbowo-wodzikowego.
% Wyj�cie:
%   T   - tablica do zapisu kolejnych chwil.
%   Q   - tablica do zapisu rozwi�za� zadania o po�o�eniu w kolejnych chwilach.
%   DQ  - tablica do zapisu rozwi�za� zadania o pr�dko�ci w kolejnych chwilach.
%   D2Q - tablica do zapisu rozwi�za� zad. o przyspieszeniu w kolejnych chwilach.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

% Przybli�enie startowe (gdy brak rozwi�zania z poprzedniej chwili)
q=zeros(9,1); dq=zeros(9,1); d2q=zeros(9,1);
lroz=0; % Licznik rozwi�za� (s�u�y do numerowania kolumn w tablicach z wynikami)
dt=0.05; % Odst�p pomi�dzy kolejnymi chwilami

% Rozwi�zywanie zada� kinematyki w kolejnych chwilach t
for t=0:dt:1.5
    % Zadanie o po�o�eniu. 
    % Przybli�eniem pocz�tkowym jest rozwi�zanie z poprzedniej chwili, 
    % powi�kszone o sk�adniki wynikaj�ce z obliczonej pr�dko�ci i przyspieszenia.
    q0=q+dq*dt+0.5*d2q*dt^2;
    q=NewRaph(q0,t); 
    
    dq=Predkosc(q,t);  % Zadanie o pr�dko�ci

    d2q=Przyspieszenie(dq,q,t);  % Zadanie o przyspieszeniu

    % Zapis do tablic gromadz�cych wyniki 
    lroz=lroz+1;
    T(1,lroz)=t; 
    Q(:,lroz)=q;
    DQ(:,lroz)=dq;
    D2Q(:,lroz)=d2q;
end
