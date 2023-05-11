% Zadane wspó³rzêdne i prêdkoœci
q=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]'; 
dq=[-(1+sqrt(2)) 0 0 -1 sqrt(2) 2]';
 
% Obliczenie macierzy M, Fq, G i Q
[F,Fq,G,M,Q]=Macierze(q,dq); 

% Macierz uk³adu równañ
A=[M,Fq';Fq,zeros(4,4)];     

% Prawa strona uk³adu równañ
b=[Q;G]; 

% Obliczenie przyspieszeñ i mno¿ników Lagrange'a
x=A\b;                       

%Drukowanie wyników
d2q=x(1:6,1)
Lambda=-x(7:10,1) 

