clc
clear

%DANE
a = 0.1;
b = 0.2;
m1 = 1;
j1 = 0.015;
g = [0 -10]';

%theta = fsolve(@(theta) FIk([a b theta]'), -pi/4)
theta = atan2(-b,a)


q0 = [a b theta]'
FIk(q0)

FId(q0)

q0_prim = [0 0 0]'


Gamm = Gamma(q0,q0_prim)



M = diag([m1 m1 j1])
Q = [m1.*g; 0]


LHS = [M FId(q0)'; FId(q0) zeros(2,2)]

RHS = [Q; Gamm];

res = LHS\RHS


q_wtor =  res(1:3,1)
lambdy = -res(4:5,1)

W1 = (FId(q0))'*[lambdy(1); 0]
W2 = (FId(q0))'*[0; lambdy(2)]
W1 + W2



function res = FIk(q)
OM = [0, -1; 1 0];
a = 0.1;
b = 0.2;
R = @(fi) [cos(fi), - sin(fi); sin(fi), cos(fi)];
sk1 = [-sqrt(a^2+b^2) 0 ]';
sl1 = [sqrt(a^2+b^2) 0 ]';

res = zeros(2,1);

res(1,1) = [1 0]*(-q(1:2,1) - R(q(3,1))*sk1);
res(2,1) = [0 1]*(-q(1:2,1) - R(q(3,1))*sl1);
end


function res = FId(q)
OM = [0, -1; 1 0];
a = 0.1;
b = 0.2;
R = @(fi) [cos(fi), - sin(fi); sin(fi), cos(fi)];
sk1 = [-sqrt(a^2+b^2) 0 ]';
sl1 = [sqrt(a^2+b^2) 0 ]';

res = zeros(2,3);
res(1:2,1:2) = -eye(2);

res(1,3) = [-1 0]*OM*R(q(3,1))*sk1;
res(2,3) = [0 -1]*OM*R(q(3,1))*sl1;
end

function res = Gamma(q,q_prim)
OM = [0, -1; 1 0];
a = 0.1;
b = 0.2;
R = @(fi) [cos(fi), - sin(fi); sin(fi), cos(fi)];
sk1 = [-sqrt(a^2+b^2) 0 ]';
sl1 = [sqrt(a^2+b^2) 0 ]';

res = zeros(2,1);
res(1,1) = [1 0]*(2.*OM*(-q_prim(1:2,1))*0 + (-q(1:2,1))*0^2 - R(q(3,1))*sk1.*(0-q_prim(3,1))^2)
res(2,1) = [0 1]*(2.*OM*(-q_prim(1:2,1))*0 + (-q(1:2,1))*0^2 - R(q(3,1))*sl1.*(0-q_prim(3,1))^2)
end

