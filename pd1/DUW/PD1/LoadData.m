%Funcja ładujaca dane
function [points,objects,bonds,contrains,drives] = LoadData()
%README
%Program pierwotnie wczytuje wszystkie niezbędne informacje z 5 plików CSV
%których powołanie opisane jest poniżej.

%W pliku csv o nazwie points zapisujemy współrzędne [x,y] wszystkich punktów, punkty idą
%iteracyjnie (od 1 do i)
points = readmatrix("dane/points.csv");

%W pliku csv o nazwie objects zapisywane są środki mas członów w kolejności [x,y]
%człony numerowane sa iteracyjnie (od 1 do i)
objects = readmatrix("dane/objects.csv");

% Bonds w pliku csv zapisujemy informację o parach obrotowych które nie są związane z podstawą, pierwsza kolumna przedstawia człon i, druga człon j z którym jest połączony natomiast trzecia kolumna punkt którym te człony
% sa połączone, bonds numerujemy iteracyjnie (od 1 do i), w pliktu tym
bonds = readmatrix("dane/bonds.csv");

% plik constrains zawiera informacje o parach obrotowych połączonych z podstawą
%pierwsza kolumna przedstawia człon i, druga człon j z którym jest połączony natomiast trzecia kolumna punkt w którym te człony
% sa połączone, bonds numerujemy iteracyjnie (od 1 do i), w pliktu tym
contrains = readmatrix("dane/constrains.csv");

% plik drives opisuje pary postępowe wraz z więzami kierującymi zadanymi
% mechanizmowi zapisujemy w nim: 1 kolumna - środek członu i , 2 kolumna
% środek członu - j, 3 kolumna - punkt i , 4- kolumna punkt j, 
% kinematyczne plik ten zawiera również stałe l,a,w,fi które zostały
% dobrane samodzielnie gdyż tak mówi polecenie
drives = readmatrix("dane/drives.csv");
end