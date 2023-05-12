clc; clear;

%określenie przedziału czasowego dla którego mają zostać wykonane
%obliczenia
t= linspace(0,15,501);

%wczytanie danych dotyczących konstrukcji modelu z plików csv
[points,objects,bonds,contrains,drives] = LoadData();

%obliczenie położeń, prędkości i przyspieszeń środków ciężkości członów
[q,q_prim,q_wtor] = Solve(t,points,objects,bonds,contrains,drives);

%wyświetlenie wykresów położeń, prędkości oraz przyspieszeń wybranego
%punktu wybranego członu lub środka ciężkości
[XY, V, A] = PointInfo(t,q,q_prim,q_wtor,objects,10,points,12);
%PointInfo(t,q,q_prim,q_wtor,objects,1)