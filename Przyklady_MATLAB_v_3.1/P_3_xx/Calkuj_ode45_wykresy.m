function Calkuj_ode45_wykresy(tK)
% Calkuj_ode45_wykresy
% Ca�kowanie r�wna� ruchu metod� Rungego-Kutty - ode45
% Przedzia� czasu o d�ugo�ci tK
% Brak stabilizacji wi�z�w
% Po wykonaniu oblicze� utworzenie wykres�w dok�adno�ci spe�nienia wi�z�w

if nargin == 0; tK=2; end

% Przedzia� ca�kowania
t0=0;  % t0 - pocz�tek, tK - koniec

% Warunki pocz�tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]';
dq0=zeros(6,1);
Y0=[q0;dq0];

% Ca�kowanie (bez stabilizacji wi�z�w)
[t,Y]=ode45(@H,t0:0.1:tK,Y0); % Wyniki tablicowane co 0.1 sekundy

% Wykresy dok�adno�ci spe�nienia wi�z�w
n=size(Y,1); % Liczba wierszy w tablicy wynik�w
err_F(n)=0; err_dF(n)=0; err_d2F(n)=0; % Niespe�nienie wi�z�w - deklaracja d�ugo�ci wektor�w 
for i=1:n
    q=Y(i,1:6)'; dq=Y(i,7:12)';  % Po�o�enia i pr�dko�ci w i-tym stablicowanym kroku
    [F,Fq,G,M,Q]=Macierze(q,dq);
    % Ponowne obliczenie przyspiesze� [procedura ode_45 ich nie przechowuje :( ]
    A=[M,Fq';Fq,zeros(4,4)];     
    b=[Q;G];                   
    x=A\b;                           
    d2q=x(1:6,1);
    % Obliczenie miar rozerwania wi�z�w
    err_F(i)=norm(F);               % B��d wi�z�w dla po�o�e�
    err_dF(i)=norm(Fq*dq);          % B��d wi�z�w dla pr�dko�ci
    err_d2F(i)=norm(Fq*d2q-G);      % B��d wi�z�w dla przyspiesze�
end
% Tworzenie wykres�w
plot(t,err_F,'b','LineWidth',2); hold on;
plot(t,err_dF,'g','LineWidth',2);
plot(t,err_d2F,'r','LineWidth',2);
grid;
legend('Po�o�enia','Pr�dko�ci','Przyspieszenia'); hold off;
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
