% Zadane wsp�rz�dne i pr�dko�ci
q=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]'; 
dq=[-(1+sqrt(2)) 0 0 -1 sqrt(2) 2]';
 
% Obliczenie macierzy M, Fq, G i Q
[F,Fq,G,M,Q]=Macierze(q,dq); 

% Macierz uk�adu r�wna�
A=[M,Fq';Fq,zeros(4,4)];     

% Prawa strona uk�adu r�wna�
b=[Q;G]; 

% Obliczenie przyspiesze� i mno�nik�w Lagrange'a
x=A\b;                       

%Drukowanie wynik�w
d2q=x(1:6,1)
Lambda=-x(7:10,1) 

