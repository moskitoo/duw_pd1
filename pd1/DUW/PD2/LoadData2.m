%Funcja ładujaca dane
function [mass,forces,dumpers] = LoadData2()
% wczytanie masy i momentów bezwładności członów
mass=readmatrix("dane/mass.csv");

% wczytanie sił zewnętrznych działających na układ - człon do którego
% przyłożona jest siła, punkt związany z tym członem do którego przyłożona
% jest siła, wartość tej siły, kąt działania siły
forces=readmatrix("dane/forces.csv");

dumpers=readmatrix("dane/dumpers.csv");
end