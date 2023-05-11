function F = CalcForces(points,objects,forces,q)
OM = RMatrix(pi/2);
F=zeros(3*length(objects),1);

for i = 1:size(forces,1)
s = (points(forces(i,2),:)-objects(forces(i,1),:))';
angle=deg2rad(forces(i,4));
F(3*forces(i,1)-2)=forces(i,3)*cos(angle);
F(3*forces(i,1)-1)=forces(i,3)*sin(angle);
F(3*forces(i,1))= (OM*RMatrix(getFi(q,forces(1,1)))*s)'*F((3*forces(i,1)-2):(3*forces(i,1)-1));
end
end

%zwykła macierz obrotu
function res = RMatrix(fi)
res = [cos(fi), -sin(fi); sin(fi), cos(fi)];
end


%%Funkcje służace do pobierana danych z wektora q

%funkcja przyjmująca za argument wektor niewiadomych oraz zwracająca
%współrzędne x oraz y wskazanego i członu
function XY = getXY(q,i)
x = q(3*i - 2,1);
y = q(3*i - 1,1);
XY = [x;y];
end

%funkcja przyjmująca za argument wektor niewiadomych oraz zwracająca
%kąt pochylenia i-tego członu
function fi = getFi(q,i)
fi = q(3*i,1);
end