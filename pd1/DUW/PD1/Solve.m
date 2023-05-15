
%%% SOLVER %%%
%Glowna funkcja obliczająca polozenia predkosci i przyspieszania dla
%poszczegolnych chwil czasowych
function [q,q_prim,q_wtor] = Solve(t,...
points,objects,bonds,contrains,drives)

FIK = @(q) FIK_func(q,bonds,contrains,points,objects);
FID = @(q,t) FID_func(q,t,drives,points,objects);
FId = @(q) FId_func(q,bonds,contrains,points,objects,drives);
FIt = @(q,t) FIt_func(q,t,bonds,contrains,points,objects,drives);
Gamma = @(q,q_prim,t) Gamma_func(q,q_prim,t,bonds,contrains,points,objects,drives);
q0 = q0_func(objects);

%przygotowanie macierzy do których będą zapisywane otrzymane wyniki
q = zeros(length(q0),length(t));
q_prim = zeros(length(q0),length(t)); 
q_wtor = zeros(length(q0),length(t));

for i = 1:length(t)
    %wyznaczenie układu nieliniowych równań algebraicznych
    F = @(q) [FIK(q) ; FID(q,t(i))]; 
    %kiedy i = 0 to wykorzystywane jest q0 zdefiniowane wyżej
    if(i ~= 1)
      %wektor położeń absolutnych
      q0 = q(:,i-1);
      %położenie początkowe punktu jest położeniem z poprzedniej iteracji 
    end
    %Wyznaczanie macierzy jakobiego
    [FIKd, FIDd] = FId(q0);
    FId_val = [FIKd; FIDd];
    %sprawdzenie niezależności więzów
    if(0 == checkJacobian(FId_val))
        break;
    end
    %wyznaczenie wektora położeń za pomocą metody newtona rhapsona
    q(:,i) = NR(F,FId,q0);
    [FIKd, FIDd] = FId(q(:,i));
    FId_val = [FIKd; FIDd];
    %ponowne sprawdzenie niezależności więzów dla obliczonych położeń
    if(0 == checkJacobian(FId_val))
        break;
    end
    %wyznaczenie wektora prędkości
    q_prim(:,i) = FId_val\(-FIt(q(:,i),t(i)));
    %wyznaczenie wektora przyspieszeń
    q_wtor(:,i) = FId_val\Gamma(q(:,i),q_prim(:,i),t(i));  
end
end



%Funkcja wyznaczająca równanie więzów kinematycznych
function  res = FIK_func(q,bonds,contrains,points,objects)
%tworzenie wektora przechowującego wartości zwracane przez funkcję
res = zeros(2*(size(bonds,1)+size(contrains,1)),1);

%wzór 2.18
%uzupełnienie macierzy FIK o równania opisujące pary kinematyczne
%człon-człon
for i = 1:size(bonds,1)
    res((2*i-1):(2*i),1) = getXY(q,bonds(i,1))  - getXY(q,bonds(i,2)) + RMatrix(getFi(q,bonds(i,1)))*((points(bonds(i,3),:) - objects(bonds(i,1),:))') - RMatrix(getFi(q,bonds(i,2)))*((points(bonds(i,3),:) - objects(bonds(i,2),:))') ;
end

%uzupełnienie macierzy FIK o równania opisujące pary kinematyczne
%człon-podłoże
for i = 1:size(contrains,1)  %                                                                                   ------>|                         Sa                           |<------        rj      
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))),1) = getXY(q,contrains(i,1))  + RMatrix(getFi(q,contrains(i,1)))*((points(contrains(i,2),:) - objects(contrains(i,1),:))') - points(contrains(i,2),:)';
end
end


%Funkcja wyznaczająca równanie więzów kierujących oraz więzów
%kinematycznych par postepowych
function  res = FID_func(q,t,drives,points,objects)
%macierz przechowująca wyniki zwracane przez funkcję ma taki wymiar,
%ponieważ każda para postępowa opisywana jest przez 2 równania kinematyczne oraz 1 dynamiczne 
res = zeros(3.*size(drives,1),1);
for i = 1:size(drives,1)
    %wzór 2.19
    %warunek zachowania kąta
    res(i,1) = getFi(q,drives(i,1))  - getFi(q,drives(i,2));
    %uzupełnienie prostopadłości
    %wzór 2.22
    %wyznaczenie wektora prostopadłego
    v = calcV(drives,i,points);
    res(size(drives,1) + i,1) = ((RMatrix(getFi(q,drives(i,2)))*v)')*(getXY(q,drives(i,2)) - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))*((points(drives(i,3),:) - objects(drives(i,1),:))')) + (v')*((points(drives(i,4),:) - objects(drives(i,2),:))');
    u_abs = RMatrix(getFi(q,drives(i,2)))*wersorU(points(drives(i,3),:)',points(drives(i,4),:)');
    %wzór 2.28
    %opis więzów kierujących
    res(2.*size(drives,1) + i) = (u_abs')* (getXY(q,drives(i,2)) + RMatrix(getFi(q,drives(i,2)))* ((points(drives(i,4),:) -...
        objects(drives(i,2),:))') - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))* ((points(drives(i,3),:) - objects(drives(i,1),:))')) - ...
         f(drives,i,t);
end
end

%Funkcja obliczajaca macierz jakobiego z podziałem na FIKd i FIDd
function  [FIKd, FIDd] = FId_func(q,bonds,contrains,points,objects,drives)
%wymiar liczba członów * 3 x liczba członów * 3 
res = zeros(length(q),length(q));
%macierz charakterystyczna omega
OM = RMatrix(pi/2);
for i = 1:size(bonds,1)
    %zapisanie id obiektów do zmiennych w celu wygodniejszego używania ich
    %w obliczeniach
    Obj1 = bonds(i,1);
    Obj2 = bonds(i,2);
    Point = bonds(i,3);
    %wzory 2.31-2.34 str.48
    %wyznaczenie pochodnych cząstkowych więzów kinematycznych par
    %człon-człon
    res((2*i-1):(2*i), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*i-1):(2*i), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*i-1):(2*i), (3*Obj2-2):(3*Obj2-1)) = -eye(2);
    res((2*i-1):(2*i), 3*Obj2) = -OM*RMatrix(getFi(q,Obj2))*((points(Point,:) - objects(Obj2,:))');
end
%wyznaczenie pochodnych cząstkowych więzów kinematycznych par
%człon-podłoże
for i = 1:size(contrains,1)
    Obj1 = contrains(i,1);
    Point = contrains(i,2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    %wektor sb jest zerowy
end

%wyznaczenie pochodnych cząstkowych więzów kinematycznych par postępowych
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    %wzory 2.43-2.46
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj1-2):(3*Obj1-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj1) = 1;
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj2-2):(3*Obj2-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj2) = -1;
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    %wektor prostopadly
    v = calcV(drives,i,points);
    %wzory 2.49-2.52
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'));
end
%liczenie FIDd
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    %wyznaczenie części macierzy jakobiego opisującej więzy kierujące pary
    %postępowej
    v = wersorU(points(drives(i,3),:)', points(drives(i,4),:)');
    %wzory 2.49 do 2.52
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'));
end

FIKd = res(1:(2*(size(contrains,1)+size(bonds,1))),:);
FIDd = res(((2*(size(contrains,1)+size(bonds,1)))+1):length(q),:);
end


%Funkcja obliczająca pochodną FI po t
function  res = FIt_func(~,t,bonds,contrains,~,~,drives)
    res = zeros(2*(size(bonds,1)+size(contrains,1)) + 3* size(drives,1),1);
    %pominięcie elementów statycznych i przejście do częsci tłoków 
    offset = 2*(size(bonds,1)+size(contrains,1) +size(drives,1));
    for i=1:size(drives,1)
%         wyznaczenie pochodnej po czasie funkcji opisujacej wysuniecie
%         tloka
        res(offset+i) = -df(drives,i,t); 
    end
end

%Funkcja obliczajaca Gamma K i Gamma D
function res = Gamma_func(q,q_prim,t,bonds,contrains,points,objects,drives)
OM = RMatrix(pi/2);
res = zeros(2*(size(bonds,1)+size(contrains,1)) + 3* size(drives,1),1);
%Gamma K
for i = 1:size(bonds,1)
    %wzór 2.42
    res((2*i-1):(2*i),1) = (getFi(q_prim,bonds(i,1)).^2).*RMatrix(getFi(q,bonds(i,1)))*((points(bonds(i,3),:) - objects(bonds(i,1),:))') - ...
        (getFi(q_prim,bonds(i,2)).^2).*RMatrix(getFi(q,bonds(i,2)))*((points(bonds(i,3),:) - objects(bonds(i,2),:))');
end
for i = 1:size(contrains,1)
    %przesuniecie o tyle ile miejsca zajela poprzednia petla
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))),1) = (getFi(q_prim,contrains(i,1)).^2).*RMatrix(getFi(q,contrains(i,1)))*((points(contrains(i,2),:) - objects(contrains(i,1),:))');
end
%Gamma D
for i = 1:size(drives,1)
    res((2*(size(contrains,1)+size(bonds,1))+ i),1) = 0;
    
    v = calcV(drives,i,points);
    %zapisanie wektorów położeń oraz prędkości do zmiennych co ułatwia
    %stosowanie ich w kodzie
    r_i = getXY(q,drives(i,1));
    r_j = getXY(q,drives(i,2));
    r_i_prim = getXY(q_prim,drives(i,1));
    r_j_prim = getXY(q_prim,drives(i,2));
    fi_i_prim = getFi(q_prim,drives(i,1));
    fi_j_prim = getFi(q_prim,drives(i,2));
    s_a = (points(drives(i,3),:) - objects(drives(i,1),:))';
    %wzór 2.59
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),1) = ((RMatrix(getFi(q,drives(i,2)))*v)')* ...
        (2.*fi_j_prim.*OM*(r_j_prim - r_i_prim) + (fi_j_prim.^2).*(r_j - r_i) - ((fi_j_prim - fi_i_prim).^2).*RMatrix(getFi(q,drives(i,1)))*s_a);
    u_abs = RMatrix(getFi(q,drives(i,2)))*wersorU(points(drives(i,3),:)',points(drives(i,4),:)');

%     wzor 2.71
    res((2*(size(contrains,1)+size(bonds,1)+ size(drives,1)) + i),1) = (u_abs')* ...
        (2.*fi_j_prim.*OM*(r_j_prim - r_i_prim) + (fi_j_prim.^2).*(r_j - r_i) - ((fi_j_prim - fi_i_prim).^2).*RMatrix(getFi(q,drives(i,1)))*s_a) + ...
        d2f(drives,i,t);
end
end

%%% Funcja rozwiązujaca nielinowy uklad rownan metodą Newtona - Rhapsona

function q=NR(FI,FId,q0)
%maksymalna liczba iteracji
max_iter = 10000;
%precyzja obliczeń
precise = 1e-15;
q=q0;
F=FI(q);
iter=1; % Licznik iteracji
while ( (norm(F)>precise) && (iter < max_iter) )
    F=FI(q);
    %macierz jakobiego
    [FIKd, FIDd]  = FId(q);
    Fq= [FIKd; FIDd];
    %sprawdzenie niezależności więzów
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
%wyznacznik to wartosc bliska zeru
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
        % r jest niezerowe, równe jest położeniu środka ciężkości. fi jest
        % 0, wszystkie układy lokalne są zwrócone zgodnie z układem
        % globalnym
    end
    q0 = q0';
end


%%Funkcje opisujące zadana dlugosc silownika
%Równanie reprezentujące więzy kierujące podane w zadaniu
function res = f(drives,i,t)
res = drives(i,5) + drives(i,6).*sin(drives(i,7).*t + drives(i,8));
end

%pierwsza pochodna równania opisującego wysunięcie siłownika
function res = df(drives,i,t)
res = drives(i,7).* drives(i,6).*cos(drives(i,7).*t + drives(i,8));
end

%druga pochodna równania opisującego wysunięcie siłownika
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

