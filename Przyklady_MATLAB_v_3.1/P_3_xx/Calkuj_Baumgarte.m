function Calkuj_Baumgarte(tK)
% Calkuj_Baumgarte
% Ca�kowanie r�wna� ruchu metod� Rungego-Kutty  - ode45
% Stabilizacja wi�z�w metod� Baumgarte'a
% (modyfikacje wzgl�dem Calkuj_ode45 dotycz� tylko funkcji podca�kowej H)

tic %Pocz�tek pomiaru czasu wykonywania oblicze�
% Przedzia� ca�kowania
t0=0;  % t0 - pocz�tek, tK - koniec

% Warunki pocz�tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]';
dq0=zeros(6,1);
Y0=[q0;dq0];


% Ca�kowanie 
[t,Y]=ode45(@H,[t0,tK],Y0);

toc %Koniec pomiaru czasu wykonywania oblicze�

% Drukowanie wynik�w dla czasu ruchu r�wnego tK.
n=size(Y,1);
qK=Y(n,1:6)'; dqK=Y(n,7:12)';   % Po�o�enie i pr�dko�� w chwili tK
q___dq=[qK dqK ]                % Drukowanie
[F]=Macierze(qK,dqK);           % Obliczenie lewej strony r�wna� wi�z�w
norm_F=norm(F)                  % Miara rozerwania wi�z�w po czasie tK
end


function dY=H(t,Y)
%Funkcja podca�kowa
alf=5;bet=5;                  % Wsp�czyniki odpowiadaj�ce za stabilizacj� met. Baumgarte'a
q=Y(1:6,:);                   % Czytelne nazwy po�o�e� i pr�dko�ci
dq=Y(7:12,:);
[F,Fq,G,M,Q]=Macierze(q,dq);  % Obliczenia dla aktualnych po�o�e� i pr�dko�ci
A=[M,Fq';Fq,zeros(4,4)];      % Macierz uk�adu r�wna�
b=[Q;G-2*alf*Fq*dq-bet^2*F];  % Prawa strona uk�adu r�wna� (z uwzgl�dnieniem stabilizacji wi�z�w)
x=A\b;                        % Obliczenie przyspiesze� i mno�nik�w Lagrange'a
dY(1:6,1)=dq;                 % Obliczenie wektora prawych stron r�wnania r�niczkowego
dY(7:12,1)=x(1:6,1);
end
