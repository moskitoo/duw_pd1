%Funckja prezentujaca dane dotyczące obiektu lub punktu
function [] = PointInfo(t,q,q_prim,q_wtor,objects,obj,points,point)

figure(1)
dispObj(q(:,1))
figure(2)

if(nargin == 8)
    XY = zeros(2,length(t));
    V = zeros(2,length(t));
    A = zeros(2,length(t));
    for i = 1:length(t)
        XY(:,i) = PointXY(q(:,i),obj,point,points,objects);
        V(:,i) = PointV(q(:,i),q_prim(:,i),obj,point,points,objects);
        A(:,i) = PointA(q(:,i),q_prim(:,i),q_wtor(:,i),obj,point,points,objects);
    end
    subplot(3,2,1)
    plot(t,XY(1,:))
    title("Położenie x")
    subplot(3,2,2)
    plot(t,XY(2,:))
    title("Położenie y")
    subplot(3,2,3)
    plot(t,V(1,:))
    title("Prędkość x")
    subplot(3,2,4)
    plot(t,V(2,:))
    title("Prędkość y")
    subplot(3,2,5)
    plot(t,A(1,:))
    title("Przyśpieszenie x")
    subplot(3,2,6)
    plot(t,A(2,:))
    title("Przyśpieszenie y")
elseif (nargin == 6)
    XY = q((3*obj-2):(3*obj),:); 
    V = q_prim((3*obj-2):(3*obj),:); 
    A = q_wtor((3*obj-2):(3*obj),:);
    subplot(3,3,1)
    plot(t,XY(1,:))
    title("Położenie x")
    subplot(3,3,2)
    plot(t,XY(2,:))
    title("Położenie y")
    subplot(3,3,3)
    plot(t,XY(3,:))
    title("Kąt theta")
    subplot(3,3,4)
    plot(t,V(1,:))
    title("Prędkość x")
    subplot(3,3,5)
    plot(t,V(2,:))
    title("Prędkość y")
    subplot(3,3,6)
    plot(t,V(3,:))
    title("Prędkość kątowa")
    subplot(3,3,7)
    plot(t,A(1,:))
    title("Przyśpieszenie x")
    subplot(3,3,8)
    plot(t,A(2,:))
    title("Przyśpieszenie y")
    subplot(3,3,9)
    plot(t,A(3,:))
    title("Przyśpieszenie kątowe")
else
    disp("ERR: Number of argument in PointInfo")
end


end

%%Funkcje animacyjne do prezentacji wynikow - dodatek

function [] =drawCords(q,drawXY)
figure(1)
l = 0.1;
points = zeros(2,length(q)/3);
for i = 1:(length(q)/3)
    points(:,i) = [q(3*i-2) ; q(3*i-1)];
end
hold on
plot(points(1,:),points(2,:),'o');
if(drawXY)
for i = 1:(length(q)/3)
     R = RMatrix(q(3*i));
     xy = l.*eye(2)*R;
     x = [points(1,i) points(1,i)+ xy(1,1)];
     y = [points(2,i) points(2,i)+ xy(2,1)];
     line(x,y)
     x = [points(1,i) points(1,i)+ xy(1,2)];
     y = [points(2,i) points(2,i)+ xy(2,2)];
     line(x,y)
end
end
daspect([1 1 1])
hold off  
end

function [] = dispObj(q)
for i = 1:size(q,2)
    drawCords(q(:,i),true)
    pause(0.1)
    drawnow
end
end

%%Funkcje elementarne pozwalajace na obliczenie polozenia, predkosci i
%%przyspieszenia punktu wzgledem danego objektu

function XY  = PointXY(q,obj,point,points,objects)
XY0 = getXY(q,obj);
S = (points(point,:)-objects(obj,:))';
XY = XY0 + RMatrix(getFi(q,obj))*S;
end

function V  = PointV(q,q_prim,obj,point,points,objects)
OM = RMatrix(pi/2);
S = (points(point,:)-objects(obj,:))';
V =  getXY(q_prim,obj)+getFi(q_prim,obj).*OM*RMatrix(getFi(q,obj))*S;
end

function A  = PointA(q,q_prim,q_wtor,obj,point,points,objects)
OM = RMatrix(pi/2);
S = (points(point,:)-objects(obj,:))';
A = getXY(q_wtor,obj) + getFi(q_wtor,obj).*OM*RMatrix(getFi(q,obj))*S - (getFi(q_prim,obj).^2).* RMatrix(getFi(q,obj))*S;
%+%2.*getFi(q_prim,obj).*OM*getXY(q_prim,obj);
end

%zwykła macierz obrotu
function res = RMatrix(fi)
res = [cos(fi), -sin(fi); sin(fi), cos(fi)];
end

%%Funkcje służace do pobierana danych z wektora q

%funkcja przyjmująca za argument wektor niewiadomych oraz zwracająca
%współrzędne x oraz y wskazanego i członu
function XY = getXY(q,i)
x = q(3*i - 2,1);
y = q(3*i - 1,1);
XY = [x;y];
end

%funkcja przyjmująca za argument wektor niewiadomych oraz zwracająca
%kąt pochylenia i-tego członu
function fi = getFi(q,i)
fi = q(3*i,1);
end


