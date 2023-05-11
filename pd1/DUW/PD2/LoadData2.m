%Funcja ładujaca dane
function [mass,forces,dumpers] = LoadData2()
mass=readmatrix("dane/mass.csv");
forces=readmatrix("dane/forces.csv");
dumpers=readmatrix("dane/dumpers.csv");
end