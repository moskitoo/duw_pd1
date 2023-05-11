function Calkuj(dt)
% Calkuj(dt)
% Ca�kowanie r�wna� ruchu 
% Sta�y krok dt, brak stabilizacji wi�z�w

tic %Pocz�tek pomiaru czasu wykonywania oblicze�
% Przedzia� ca�kowania
t0=0;  tK=1; 

% Warunki pocz�tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]'; 
dq0=zeros(6,1);

% Ca�kowanie (bez stabilizacji wi�z�w)
t=t0; q=q0; dq=dq0; 
while t < tK
   [F,Fq,G,M,Q]=Macierze(q,dq);  % Obliczenia dla aktualnych po�o�e� i pr�dko�ci
    A=[M,Fq';Fq,zeros(4,4)];     % Macierz uk�adu r�wna�
    b=[Q;G];                     % Prawa strona uk�adu r�wna�
    x=A\b; d2q=x(1:6,1);         % Obliczenie przyspiesze� i mno�nik�w Lagrange'a
    t=t+dt;                      % Wyznaczenie kolejnej chwili
    q=q+dq*dt+0.5*d2q*dt^2;      % Obliczenie wsp�rz�dnych w kolejnej chwili
    dq=dq+d2q*dt;                % Obliczenie pr�dko�ci w kolejnej chwili
end

toc %Koniec pomiaru czasu wykonywania oblicze�

% Drukowanie wynik�w dla czasu ruchu r�wnego tK.
q___dq=[q dq]     % Po�o�enie i pr�dko�� w chwili tK
norm_F=norm(F)    % Miara rozerwania wi�z�w po czasie tK
end




    