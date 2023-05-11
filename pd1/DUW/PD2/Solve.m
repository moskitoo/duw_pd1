
%%% SOLVER %%%
%Glowna funkcja obliczająca polozenia predkosci i przyspieszania dla
%poszczegolnych chwil czasowych
function [q,q_prim,q_wtor] = solve(t,...
points,objects,bonds,contrains,drives)

FIK = @(q) FIK_func(q,bonds,contrains,points,objects);
FID = @(q,t) FID_func(q,t,drives,points,objects);
FId = @(q) FId_func(q,bonds,contrains,points,objects,drives);
FIt = @(q,t) FIt_func(q,t,bonds,contrains,points,objects,drives);
Gamma = @(q,q_prim,t) Gamma_func(q,q_prim,t,bonds,contrains,points,objects,drives);
q0 = q0_func(objects);

q = zeros(length(q0),length(t));
q_prim = zeros(length(q0),length(t));
q_wtor = zeros(length(q0),length(t));
gammatest = zeros(length(q0),length(t));

for i = 1:length(t)
    F = @(q) [FIK(q) ; FID(q,t(i))];
    if(i ~= 1)
      q0 = q(:,i-1);
    end
    [FIKd, FIDd] = FId(q0);
    FId_val = [FIKd; FIDd];
    if(0 == checkJacobian(FId_val))
        break;
    end
    q(:,i) = NR(F,FId,q0);
    %q(:,i) = fsolve(F,q0);
    [FIKd, FIDd] = FId(q(:,i));
    FId_val = [FIKd; FIDd];
    if(0 == checkJacobian(FId_val))
        break;
    end
    q_prim(:,i) = FId_val\(-FIt(q(:,i),t(i)));
    gammatest(:,i) =   Gamma(q(:,i),q_prim(:,i),t(i));
    q_wtor(:,i) = FId_val\Gamma(q(:,i),q_prim(:,i),t(i));  
end
    %gammatest
end

%Funkcja wyznaczajaca rownanie wiezow kinematyczne
function  res = FIK_func(q,bonds,contrains,points,objects)
res = zeros(2*(size(bonds,1)+size(contrains,1)),1);
for i = 1:size(bonds,1)
    res((2*i-1):(2*i),1) = getXY(q,bonds(i,1))  - getXY(q,bonds(i,2)) + RMatrix(getFi(q,bonds(i,1)))*((points(bonds(i,3),:) - objects(bonds(i,1),:))') - RMatrix(getFi(q,bonds(i,2)))*((points(bonds(i,3),:) - objects(bonds(i,2),:))') ;
end
for i = 1:size(contrains,1)
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))),1) = getXY(q,contrains(i,1))  + RMatrix(getFi(q,contrains(i,1)))*((points(contrains(i,2),:) - objects(contrains(i,1),:))') - points(contrains(i,2),:)';
end
end

%Funkcja wyznaczajaca rownanie wiezow kierujacych
function  res = FID_func(q,t,drives,points,objects)
res = zeros(3.*size(drives,1),1);
for i = 1:size(drives,1)
    res(i,1) = getFi(q,drives(i,1))  - getFi(q,drives(i,2));
    v = calcV(drives,i,points);
    res(size(drives,1) + i,1) = ((RMatrix(getFi(q,drives(i,2)))*v)')*(getXY(q,drives(i,2)) - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))*((points(drives(i,3),:) - objects(drives(i,1),:))')) + (v')*((points(drives(i,4),:) - objects(drives(i,2),:))');
    %u_abs = wersorU(getXY(q,drives(i,1)) + RMatrix(getFi(q,drives(i,1)))* ((points(drives(i,3),:) - objects(drives(i,1),:))'),getXY(q,drives(i,2)) + RMatrix(getFi(q,drives(i,2)))* ((points(drives(i,4),:) - objects(drives(i,2),:))'));
    %znalazlem szybszy sposob na u_abs
    u_abs = RMatrix(getFi(q,drives(i,2)))*wersorU(points(drives(i,3),:)',points(drives(i,4),:)');
    res(2.*size(drives,1) + i) = (u_abs')* (getXY(q,drives(i,2)) + RMatrix(getFi(q,drives(i,2)))* ((points(drives(i,4),:) -...
        objects(drives(i,2),:))') - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))* ((points(drives(i,3),:) - objects(drives(i,1),:))')) - ...
         f(drives,i,t);
end
end

%Funkcja obliczajaca macierz jakobiego z podziałem na FIKd i FIDd
function  [FIKd, FIDd] = FId_func(q,bonds,contrains,points,objects,drives)
res = zeros(length(q),length(q));
OM = RMatrix(pi/2);
for i = 1:size(bonds,1)
    Obj1 = bonds(i,1);
    Obj2 = bonds(i,2);
    Point = bonds(i,3);
    res((2*i-1):(2*i), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*i-1):(2*i), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*i-1):(2*i), (3*Obj2-2):(3*Obj2-1)) = -eye(2);
    res((2*i-1):(2*i), 3*Obj2) = -OM*RMatrix(getFi(q,Obj2))*((points(Point,:) - objects(Obj2,:))');
end
for i = 1:size(contrains,1)
    Obj1 = contrains(i,1);
    Point = contrains(i,2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj1-2):(3*Obj1-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj1) = 1;
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj2-2):(3*Obj2-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj2) = -1;
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    v = calcV(drives,i,points);
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'));
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    v = wersorU(points(drives(i,3),:)', points(drives(i,4),:)');
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'));
end

FIKd = res(1:(2*(size(contrains,1)+size(bonds,1))),:);
FIDd = res(((2*(size(contrains,1)+size(bonds,1)))+1):length(q),:);
end


%Funkcja obliczająca pochodną FI po t
function  res = FIt_func(q,t,bonds,contrains,points,objects,drives)
    res = zeros(2*(size(bonds,1)+size(contrains,1)) + 3* size(drives,1),1);
    offset = 2*(size(bonds,1)+size(contrains,1) +size(drives,1));
    for i=1:size(drives,1)
        res(offset+i) = -df(drives,i,t); 
    end  
end

%Funkcja obliczajaca Gamma K i Gamma D
function res = Gamma_func(q,q_prim,t,bonds,contrains,points,objects,drives)
OM = RMatrix(pi/2);
res = zeros(2*(size(bonds,1)+size(contrains,1)) + 3* size(drives,1),1);
%Gamma K
for i = 1:size(bonds,1)
    res((2*i-1):(2*i),1) = (getFi(q_prim,bonds(i,1)).^2).*RMatrix(getFi(q,bonds(i,1)))*((points(bonds(i,3),:) - objects(bonds(i,1),:))') - ...
        (getFi(q_prim,bonds(i,2)).^2).*RMatrix(getFi(q,bonds(i,2)))*((points(bonds(i,3),:) - objects(bonds(i,2),:))');
end
for i = 1:size(contrains,1)
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))),1) = (getFi(q_prim,contrains(i,1)).^2).*RMatrix(getFi(q,contrains(i,1)))*((points(contrains(i,2),:) - objects(contrains(i,1),:))');
end
%Gamma D
for i = 1:size(drives,1)
    res((2*(size(contrains,1)+size(bonds,1))+ i),1) = 0;
    
    v = calcV(drives,i,points);
    r_i = getXY(q,drives(i,1));
    r_j = getXY(q,drives(i,2));
    r_i_prim = getXY(q_prim,drives(i,1));
    r_j_prim = getXY(q_prim,drives(i,2));
    fi_i_prim = getFi(q_prim,drives(i,1));
    fi_j_prim = getFi(q_prim,drives(i,2));
    s_a = (points(drives(i,3),:) - objects(drives(i,1),:))';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),1) = ((RMatrix(getFi(q,drives(i,2)))*v)')* ...
        (2.*fi_j_prim.*OM*(r_j_prim - r_i_prim) + (fi_j_prim.^2).*(r_j - r_i) - ((fi_j_prim - fi_i_prim).^2).*RMatrix(getFi(q,drives(i,1)))*s_a);
    u_abs = RMatrix(getFi(q,drives(i,2)))*wersorU(points(drives(i,3),:)',points(drives(i,4),:)');
    res((2*(size(contrains,1)+size(bonds,1)+ size(drives,1)) + i),1) = (u_abs')* ...
        (2.*fi_j_prim.*OM*(r_j_prim - r_i_prim) + (fi_j_prim.^2).*(r_j - r_i) - ((fi_j_prim - fi_i_prim).^2).*RMatrix(getFi(q,drives(i,1)))*s_a) + ...
        d2f(drives,i,t);
end
end

%%% Funcja rozwiązujaca nielinowy uklad rownan metodą NR

function q=NR(FI,FId,q0)
max_iter = 10000;
precise = 1e-15;
q=q0;
F=FI(q);
iter=1; % Licznik iteracji
while ( (norm(F)>precise) & (iter < max_iter) )
    F=FI(q);
    [FIKd, FIDd]  = FId(q);
    Fq= [FIKd; FIDd];
    if(0 == checkJacobian(Fq))
        break;
    end
    q=q-Fq\F;  % Fq\F jest równoważne inv(Fq)*F, ale mniej kosztowne numerycznie
    iter=iter+1;
end
if iter >= max_iter
    disp('BŁĄD: Po 10000 iteracjach Newtona-Raphsona nie uzyskano zbieżności ');
    q=q0;
end
end

%Sprawdzenie osobliwosci jakobianu
function res = checkJacobian(jacobian_val)
if(abs(det(jacobian_val)) < 1e-20)
    disp('BŁĄD: Osobliwość Jacobianu');
    res = 0;
else
    res = 1;
end 
end

%%Funkcje pomocnicze do wyznaczania macierzy FIx

%Funkcja licząca wersor 
function u = wersorU(a,b)
u = b-a;
u = u./norm(u);
end

%Funkcja uzywana do policzenia wektora prostopadłego do kierunku ruchu w
%parze postępowej
function v = calcV(drives,i,points)
v = RMatrix(pi/2)*wersorU(points(drives(i,3),:)', points(drives(i,4),:)');
end

%Funkcja wyznaczająca wektor przyblizenia poczatkowego
function q0 = q0_func(objects)
    q0 = [];
    %Tworzymy nasz wektor niewiadomych na podstawie znajomości liczby obiektów
    for i = 1:length(objects)
        q0((3*i-2):(3*i-1)) = objects(i,:);
        q0(3*i) = 0;
    end
    q0 = q0';
end


%%Funkcje opisujące zadana dlugosc silownika
%Równanie reprezentujące więzy kierujące podane w zadaniu
function res = f(drives,i,t)
res = drives(i,5) + drives(i,6).*sin(drives(i,7).*t + drives(i,8));
end

function res = df(drives,i,t)
res = drives(i,7).* drives(i,6).*cos(drives(i,7).*t + drives(i,8));
end

function res = d2f(drives,i,t)
res = -drives(i,7).*drives(i,7).* drives(i,6).*sin(drives(i,7).*t + drives(i,8));
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

