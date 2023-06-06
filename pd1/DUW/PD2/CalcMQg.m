function [M, Qg] = CalcMQg(mass)
g=-9.81;
% predefinicja zerowych wartości początkowych zmiennych, które będą
% wykorzystywane
v=zeros(3*size(mass,1),1);
Qg=zeros(3*size(mass,1),1);
for i = 1:length(mass)
%     wzór 3.12
%   mi
v(3*i-2)=mass(i,1);
%   mi 
v(3*i-1)=mass(i,1);
%   Ji
v(3*i)=mass(i,2);

% wymiar 2x1
% wektor siły grawitacji wzór 3.19
Qg(3*i-1)=mass(i,1)*g;
end
% tworzenie macierzy masowej układu
M = diag(v);
%%diag
end

