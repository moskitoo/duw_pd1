function Calkuj(dt)
% Calkuj(dt)
% Ca³kowanie równañ ruchu 
% Sta³y krok dt, brak stabilizacji wiêzów

tic %Pocz¹tek pomiaru czasu wykonywania obliczeñ
% Przedzia³ ca³kowania
t0=0;  tK=1; 

% Warunki pocz¹tkowe
q0=[0 0 0 1/sqrt(2) -1/sqrt(2) pi/4]'; 
dq0=zeros(6,1);

% Ca³kowanie (bez stabilizacji wiêzów)
t=t0; q=q0; dq=dq0; 
while t < tK
   [F,Fq,G,M,Q]=Macierze(q,dq);  % Obliczenia dla aktualnych po³o¿eñ i prêdkoœci
    A=[M,Fq';Fq,zeros(4,4)];     % Macierz uk³adu równañ
    b=[Q;G];                     % Prawa strona uk³adu równañ
    x=A\b; d2q=x(1:6,1);         % Obliczenie przyspieszeñ i mno¿ników Lagrange'a
    t=t+dt;                      % Wyznaczenie kolejnej chwili
    q=q+dq*dt+0.5*d2q*dt^2;      % Obliczenie wspó³rzêdnych w kolejnej chwili
    dq=dq+d2q*dt;                % Obliczenie prêdkoœci w kolejnej chwili
end

toc %Koniec pomiaru czasu wykonywania obliczeñ

% Drukowanie wyników dla czasu ruchu równego tK.
q___dq=[q dq]     % Po³o¿enie i prêdkoœæ w chwili tK
norm_F=norm(F)    % Miara rozerwania wiêzów po czasie tK
end




    