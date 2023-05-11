function R=Rot(fi)
% R=Rot(fi)
%   Obliczanie macierzy rotacji - przypadek p³aski (2x2)
% Wejœcie:
%   fi - kat fi (w radianach).
% Wyjœcie:
%   R - macierz kosinusów kierunkowych.
R=[cos(fi) -sin(fi);sin(fi) cos(fi)];

