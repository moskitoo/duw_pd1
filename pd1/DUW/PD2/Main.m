clc; clear;
clear
close all

t= linspace(0,5,2);
[points,objects,bonds,contrains,drives] = LoadData();
[mass,forces,dumpers] = LoadData2();
[t,q,q_prim,q_wtor,blad] = Solve2(t,points,objects,bonds,contrains,mass,forces,dumpers,drives);


figure(66)
PointInfo(t,q,q_prim,q_wtor,objects,1);

figure(3)
plot(blad)
hold on
legend('Blad polozenia','blad predkosci','blad przyspieszenia')
hold off

PointInfo(t,q,q_prim,q_wtor,objects,4,points,3)








