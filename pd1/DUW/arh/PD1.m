%%DANE
%PKT
A = [-1.2; 0.3];
B = [-1.1; 0.9];
D = [-0.4; 0.5];
E = [-0.4; 0.8];
F = [0.6; 0.9];
G = [0.1; 0.6];
H = [0.3; -0.2];
J = [-0.4; 0.9];
K = [-1.3; 0.7];
M = [-0.1; 0.2];
N = [0.5; 0 ];
O = [0.5; 0.5];
R = [0.4; 0.5];
%SRODKI MAS
c1 = [-1.2;0.6];
c2 = [-0.7;0.85];
c3 = [0.4;0.65];
c4 = [-0.35;0.4];
c5 = [0.1;0.9];
c6 = [-0.4;0.65];
c7 = [0.15;0.4];
c8 = [0.25;0];
c9 = [0.05;0.15];
c10= [0.35;0.05];

%SXY X - nr obj, Y- pkt
S1A = A - c1;
S1B = B - c1;
S1K = K - c1;

S2B = B - c2;
S2E = E - c2;
S2J = J - c2;

S3F = F - c3;
S3G = G - c3;
S3O = O - c3;
S3R = R - c3;

S4A = A - c4;
S4D = D - c4;
S4M = M - c4;
S4O = O - c4;

S5F = F - c5;
S5J = J - c5;

S6D = D - c6;
S6E = E - c6;

S7G = G - c7;
S8H = H - c8;
S9M = M - c9;
S10N = N - c10;

q = zeros(10*3,1);


f78 = @(t) norm(c7-c8);
f910 = @(t) 1.5*norm(c9-c10);

q0 = [c1; 0; c2; 0; c3; 0; c4; 0; c5; 0; c6; 0;c7; 0; c8; 0; c9; 0; c10; 0];

FIK  = @(q) ...
    [
    getXY(q,1) + RMatrix(getFi(q,1))*S1A - getXY(q,4) - RMatrix(getFi(q,4))* S4A;
    getXY(q,1) + RMatrix(getFi(q,1))*S1B - getXY(q,2) - RMatrix(getFi(q,2))* S2B;
    getXY(q,2) + RMatrix(getFi(q,2))*S2E - getXY(q,6) - RMatrix(getFi(q,6))* S6E;
    getXY(q,2) + RMatrix(getFi(q,2))*S2J - getXY(q,5) - RMatrix(getFi(q,5))* S5J;
    getXY(q,4) + RMatrix(getFi(q,4))*S4D - getXY(q,6) - RMatrix(getFi(q,6))* S6D;
    getXY(q,5) + RMatrix(getFi(q,5))*S5F - getXY(q,3) - RMatrix(getFi(q,3))* S3F;
    getXY(q,3) + RMatrix(getFi(q,3))*S3G - getXY(q,7) - RMatrix(getFi(q,7))* S7G;
    getXY(q,4) + RMatrix(getFi(q,4))*S4O - getXY(q,3) - RMatrix(getFi(q,3))* S3O;
    getXY(q,4) + RMatrix(getFi(q,4))*S4M - getXY(q,9) - RMatrix(getFi(q,9))* S9M;

    getXY(q,3) + RMatrix(getFi(q,3))*S3R - R;
    getXY(q,10) + RMatrix(getFi(q,10))*S10N - N;
    getXY(q,8) + RMatrix(getFi(q,8))*S8H - H;
    ];

FID = @(q,t) ...
    [
        (wersorU(getXY(q,7), getXY(q,8))')*(getXY(q,8) - getXY(q,7)) - f78(t);
        (wersorU(getXY(q,9), getXY(q,10))')*(getXY(q,10) - getXY(q,9)) - f910(t);
    ];

FI = @(q) [ 
    FIK(q);
    FID(q,0);
    ];

%FI(q0)


q = fsolve(FI,q0)


function u = wersorU(a,b)
u = b-a;
u = u./norm(u);
end

function res = RMatrix(fi)
res = [cos(fi), -sin(fi); sin(fi), cos(fi)];
end

function XY = getXY(q,i)
x = q(3*i - 2,1);
y = q(3*i - 1,1);
XY = [x;y];
end

function fi = getFi(q,i)
fi = q(3*i,1);
end
