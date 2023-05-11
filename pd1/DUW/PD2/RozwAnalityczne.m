%Analityczne
% 
% %Tworzymy macierz więzów kierujących
% FID = @(q,t) FID_func(q,t,drives,points,objects);
% 
% %fid = FID(q0,0);
% 
% OM = RMatrix(pi/2);
% fi= [q(3),q(6)];
% s=[0 1+0.5*sin(t)]';
% sdot=[0 0.5*cos(t)]';
% sddot=[0 -0.5*sin(t)]';
% % s=[0 1+0.1*t]';
% % sdot=[0 0.1]';
% % sddot=[0 0]';
% 
% F = @(q) q(1).*OM*RMatrix(fi(1))*([1 0]') - q(2).*OM*RMatrix(fi(2))*s - RMatrix(fi(2))*sdot;
% fi_prim = fsolve(F,[0;0]);
% 
% % vc1 = fi_prim(1).*OM*RMatrix(fi(1))*([0.5 0]')
% % vc3 = fi_prim(2).*OM*RMatrix(fi(2))*([0 0.25]')
% 
% Fdot = @(q) -fi_prim(1).^2.*RMatrix(fi(1))*([1 0]') + q(1)*OM*RMatrix(fi(1))*([1 0]')+ fi_prim(2).^2*RMatrix(fi(2))*s -q(2)*OM*RMatrix(fi(2))*s - 2*fi_prim(2)*OM*RMatrix(fi(2))*sdot-RMatrix(fi(2))*sddot;
% fi_pprim = fsolve(Fdot,[0;0])
% 
% ac1 = fi_pprim(1).*OM*RMatrix(fi(1))*([0.5 0]') - (fi_prim(1).^2).* RMatrix(fi(1))*([0.5 0]')

