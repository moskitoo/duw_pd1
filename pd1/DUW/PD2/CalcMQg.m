function [M, Qg] = CalcMQg(mass)
g=-9.81;
v=zeros(3*size(mass,1),1);
Qg=zeros(3*size(mass,1),1);
for i = 1:length(mass)
v(3*i-2)=mass(i,1);
v(3*i-1)=mass(i,1);
v(3*i)=mass(i,2);
Qg(3*i-1)=mass(i,1)*g;
end
M = diag(v);
%%diag
end

