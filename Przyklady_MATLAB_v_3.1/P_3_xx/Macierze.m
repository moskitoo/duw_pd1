function [F,Fq,G,M,Q]=Macierze(q,dq)
%[F,Fq,G,M,Q]=Macierze(q,dq)
%
%Wejœcie:
% q(6,1)  - wektor wspó³rzêdnych absolutnych
% dq(6,1) - wektor pochodnych wspó³rzêdnych absolutnych
%
%Wyjœcie:
% F(4,1)  - lewe strony równañ wiêzów
% Fq(4,6) - macierz Jacobiego
% G(4,1)  - wektor gamma
% M(6,6)  - macierz masowa
% Q(6,1)  - wektor si³ uogólnionych


% Wymiary mechanizmu:
a=1;                                     % D³ugoœæ wahad³a
f0=0; v0=[0;1]; sA1=[0;0]; sB0=[100;0];  % Para postêpowa 1-0
sB2=[0;a];                               % Para obrotowa 1-2 (sA1 zdefiniowane wczeœniej)
rE0=[4*a;-a]; sD2=[0;-a];                % Punkty mocowania t³umika
% Sta³a macierz:
Om=[0 -1;1 0]; 
% Przyspieszenie ziemskie (wektor):
g=[0;-10]; 
% Wspó³czynnik t³umienia:
c=10;
% Masy mechanizmu:
m1=5; J1=2; m2=3; J2=m2*a^2/3;

% Przypisanie elementom wektora q czytelnych nazw
r1=q(1:2); fi1=q(3);   r2=q(4:5); fi2=q(6);
% Przypisanie elementom wektora dq czytelnych nazw
dr1=dq(1:2,1);  dfi1=dq(3,1);   dr2=dq(4:5,1);  dfi2=dq(6,1);

% Obliczenie macierzy kosinusów kierunkowych
Rot1=Rot(fi1);  Rot2=Rot(fi2); 

% Lewe strony równañ wiêzów
F(1,1)=fi1-f0;
F(2,1)=v0'*(sB0-r1-Rot1*sA1);
F(3:4,1)=r1+Rot1*sA1-(r2+Rot2*sB2);

% Macierz Jacobiego
Fq=zeros(4,6);
Fq(1,3)=1;
Fq(2,1:2)=-v0';
Fq(2,3)=-v0'*Om*Rot1*sA1;
Fq(3:4,1:2)=eye(2);
Fq(3:4,3)=Om*Rot1*sA1;
Fq(3:4,4:5)=-eye(2);
Fq(3:4,6)=-Om*Rot2*sB2;

% Wektor Gamma
G(1,1)=0;
G(2,1)=-v0'*Rot1*sA1*dfi1^2;
G(3:4,1)=Rot1*sA1*dfi1^2-Rot2*sB2*dfi2^2;

% Macierz masowa
M=zeros(6,6);
M(1,1)=m1; M(2,2)=m1; M(3,3)=J1;
M(4,4)=m2; M(5,5)=m2; M(6,6)=J2;

% Si³y uogólnione - grawitacja
Q(1:2,1)=m1*g;
Q(3,1)=0;
Q(4:5)=m2*g;
Q(6)=0;

% Si³y uogólnione - t³umik
d=rE0-r2-Rot2*sD2;
u=d/sqrt(d'*d);
dd=-u'*(dr2+Om*Rot2*sD2*dfi2);
Q(4:6,1)=Q(4:6,1)+[eye(2);(Om*Rot2*sD2)']*u*c*dd;
