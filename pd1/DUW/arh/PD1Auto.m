clc; clear;

points = readmatrix("points.csv");
objects = readmatrix("objects.csv");
bonds = readmatrix("bonds.csv");
contrains = readmatrix("constrains.csv");
drives = readmatrix("drives.csv");

q0 = [];
for i = 1:length(objects)
    q0((3*i-2):(3*i-1)) = objects(i,:);
    q0(3*i) = 0;
end
q0 = q0';

FIK = @(q) FIK_func(q,bonds,contrains,points,objects,drives);

FIK(q0);

FID = @(q,t) FID_func(q,t,drives,points,objects);

FID(q0,0);

FIKd = @(q) FIKd_func(q,bonds,contrains,points,objects,drives);

FIKd(q0)


function  res = FIK_func(q,bonds,contrains,points,objects,drives)
res = zeros(2*(size(bonds,1)+size(contrains,1) + size(drives,1))  ,1);
for i = 1:size(bonds,1)
    res((2*i-1):(2*i),1) = getXY(q,bonds(i,1))  - getXY(q,bonds(i,2)) + RMatrix(getFi(q,bonds(i,1)))*((points(bonds(i,3),:) - objects(bonds(i,1),:))') - RMatrix(getFi(q,bonds(i,2)))*((points(bonds(i,3),:) - objects(bonds(i,2),:))') ;
end
for i = 1:size(contrains,1)
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))),1) = getXY(q,contrains(i,1))  + RMatrix(getFi(q,contrains(i,1)))*((points(contrains(i,2),:) - objects(contrains(i,1),:))') - points(contrains(i,2),:)';
end
for i = 1:size(drives,1)
    res((2*(size(contrains,1)+size(bonds,1))+ i),1) = getFi(q,drives(i,1))  - getFi(q,drives(i,2));
    v = calcV(drives,i,points);
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),1) = ((RMatrix(getFi(q,drives(i,2)))*v)')*(getXY(q,drives(i,2)) - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))*((points(drives(i,3),:) - objects(drives(i,1),:))')) + (v')*((points(drives(i,4),:) - objects(drives(i,2),:))');
end
end

function  res = FID_func(q,t,drives,points,objects)
res = zeros(size(drives,1),1);
for i = 1:size(drives,1)
    %u_abs = wersorU(getXY(q,drives(i,1)) + RMatrix(getFi(q,drives(i,1)))* ((points(drives(i,3),:) - objects(drives(i,1),:))'),getXY(q,drives(i,2)) + RMatrix(getFi(q,drives(i,2)))* ((points(drives(i,4),:) - objects(drives(i,2),:))'));
    u_abs = RMatrix(getFi(q,drives(i,2)))*wersorU(points(drives(i,3),:)',points(drives(i,4),:)');
    res(i) = (u_abs')* (getXY(q,drives(i,2)) + RMatrix(getFi(q,drives(i,2)))* ((points(drives(i,4),:) -...
        objects(drives(i,2),:))') - getXY(q,drives(i,1)) - RMatrix(getFi(q,drives(i,1)))* ((points(drives(i,3),:) - objects(drives(i,1),:))')) - ...
         f(drives,i,t);
end
end

function  res = FIKd_func(q,bonds,contrains,points,objects,drives)
res = zeros(length(q),length(q));
OM = RMatrix(pi/2);
for i = 1:size(bonds,1)
    Obj1 = bonds(i,1);
    Obj2 = bonds(i,2);
    Point = bonds(i,3);
    res((2*i-1):(2*i), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*i-1):(2*i), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*i-1):(2*i), (3*Obj2-2):(3*Obj2-1)) = -eye(2);
    res((2*i-1):(2*i), 3*Obj2) = -OM*RMatrix(getFi(q,Obj2))*((points(Point,:) - objects(Obj2,:))');
end
for i = 1:size(contrains,1)
    Obj1 = bonds(i,1);
    Point = bonds(i,2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), (3*Obj1-2):(3*Obj1-1)) = eye(2);
    res((2*(i+size(bonds,1))-1):(2*(i+size(bonds,1))), 3*Obj1) = OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj1-2):(3*Obj1-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj1) = 1;
    res((2*(size(contrains,1)+size(bonds,1))+ i),(3*Obj2-2):(3*Obj2-1)) = [0,0];
    res((2*(size(contrains,1)+size(bonds,1))+ i),3*Obj2) = -1;
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    v = calcV(drives,i,points);
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'))
end
for i = 1:size(drives,1)
    Obj1 = drives(i,1);
    Obj2 = drives(i,2);
    Point = drives(i,3);
    v = wersorU(points(drives(i,3),:)', points(drives(i,4),:)');
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj1-2):(3*Obj1-1)) = -(RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj1) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))');
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),(3*Obj2-2):(3*Obj2-1)) = (RMatrix(getFi(q,Obj2))*v)';
    res((2*(size(contrains,1)+size(bonds,1))+ 2*size(drives,1) + i),3*Obj2) = (-(RMatrix(getFi(q,Obj2))*v)')*OM*((getXY(q,drives(i,2))- getXY(q,drives(i,1))) - RMatrix(getFi(q,Obj1))*((points(Point,:) - objects(Obj1,:))'));
end

end


function u = wersorU(a,b)
u = b-a;
u = u./norm(u);
end

function v = calcV(drives,i,points)
v = RMatrix(pi/2)*wersorU(points(drives(i,3),:)', points(drives(i,4),:)');
end

function res = f(drives,i,t)
res = drives(i,5) + drives(i,6).*sin(drives(i,7).*t + drives(i,8));
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
