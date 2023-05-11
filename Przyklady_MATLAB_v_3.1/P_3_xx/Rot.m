function R=Rot(fi)
% R=Rot(fi)
%   Obliczanie macierzy rotacji - przypadek p�aski (2x2)
% Wej�cie:
%   fi - kat fi (w radianach).
% Wyj�cie:
%   R - macierz kosinus�w kierunkowych.
R=[cos(fi) -sin(fi);sin(fi) cos(fi)];

