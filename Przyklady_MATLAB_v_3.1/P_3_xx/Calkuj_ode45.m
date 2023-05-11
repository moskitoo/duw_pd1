function Calkuj_ode45(tK)
% Calkuj_ode45
% Ca�kowanie r�wna� ruchu metod� Rungego-Kutty - ode45
% Przedzia� czasu o d�ugo�ci tK
% Brak stabilizacji wi�z�w

tic %Pocz�tek pomiaru czasu wykonywania oblicze�
% Przedzia� ca�kowania
t0=0;  % t0 - pocz�tek, tK - koniec

% Warunki pocz�tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]';
dq0=zeros(6,1);
Y0=[q0;dq0];

% Ca�kowanie (bez stabilizacji wi�z�w)
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
q=Y(1:6,:);                   % Czytelne nazwy po�o�e� i pr�dko�ci
dq=Y(7:12,:);
[F,Fq,G,M,Q]=Macierze(q,dq);  % Obliczenia dla aktualnych po�o�e� i pr�dko�ci
A=[M,Fq';Fq,zeros(4,4)];      % Macierz uk�adu r�wna�
b=[Q;G];                      % Prawa strona uk�adu r�wna�
x=A\b;                        % Obliczenie przyspiesze� i mno�nik�w Lagrange'a
dY(1:6,1)=dq;                 % Obliczenie wektora prawych stron r�wnania r�niczkowego
dY(7:12,1)=x(1:6,1);
end
