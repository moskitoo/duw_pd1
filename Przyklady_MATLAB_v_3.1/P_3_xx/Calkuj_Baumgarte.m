function Calkuj_Baumgarte(tK)
% Calkuj_Baumgarte
% Ca³kowanie równañ ruchu metod¹ Rungego-Kutty  - ode45
% Stabilizacja wiêzów metod¹ Baumgarte'a
% (modyfikacje wzglêdem Calkuj_ode45 dotycz¹ tylko funkcji podca³kowej H)

tic %Pocz¹tek pomiaru czasu wykonywania obliczeñ
% Przedzia³ ca³kowania
t0=0;  % t0 - pocz¹tek, tK - koniec

% Warunki pocz¹tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]';
dq0=zeros(6,1);
Y0=[q0;dq0];


% Ca³kowanie 
[t,Y]=ode45(@H,[t0,tK],Y0);

toc %Koniec pomiaru czasu wykonywania obliczeñ

% Drukowanie wyników dla czasu ruchu równego tK.
n=size(Y,1);
qK=Y(n,1:6)'; dqK=Y(n,7:12)';   % Po³o¿enie i prêdkoœæ w chwili tK
q___dq=[qK dqK ]                % Drukowanie
[F]=Macierze(qK,dqK);           % Obliczenie lewej strony równañ wiêzów
norm_F=norm(F)                  % Miara rozerwania wiêzów po czasie tK
end


function dY=H(t,Y)
%Funkcja podca³kowa
alf=5;bet=5;                  % Wspó³czyniki odpowiadaj¹ce za stabilizacjê met. Baumgarte'a
q=Y(1:6,:);                   % Czytelne nazwy po³o¿eñ i prêdkoœci
dq=Y(7:12,:);
[F,Fq,G,M,Q]=Macierze(q,dq);  % Obliczenia dla aktualnych po³o¿eñ i prêdkoœci
A=[M,Fq';Fq,zeros(4,4)];      % Macierz uk³adu równañ
b=[Q;G-2*alf*Fq*dq-bet^2*F];  % Prawa strona uk³adu równañ (z uwzglêdnieniem stabilizacji wiêzów)
x=A\b;                        % Obliczenie przyspieszeñ i mno¿ników Lagrange'a
dY(1:6,1)=dq;                 % Obliczenie wektora prawych stron równania ró¿niczkowego
dY(7:12,1)=x(1:6,1);
end
