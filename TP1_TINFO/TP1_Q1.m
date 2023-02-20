%Q1
clc;
clf;
clear;
m=2;
N=100000;
L=1;
M=m^L;
X=randi([0 M-1],1,N);
h=0:0.01:M-1;
figure(1)
subplot(2,2,1);
histogram(X,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('L=1');
grid;
L=2;
M=m^L;
X=randi([0 M-1],1,N);
h=0:0.01:M-1;
subplot(2,2,2);
histogram(X,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('L=2');
grid;
L=3;
M=m^L;
X=randi([0 M-1],1,N);
h=0:0.01:M-1;
subplot(2,2,3);
histogram(X,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('L=3');
grid;
L=4;
M=m^L;
X=randi([0 M-1],1,N);
h=0:0.01:M-1;
subplot(2,2,4);
histogram(X,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('L=4');
grid;


