%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q2
clc;clf;clear;m=2;N=100000;L=3;M=m^L;
X=randi([0 M-1],1,N);
h=0:0.01:M-1;
subplot(2,2,3);
histogram(X,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('L=3');
grid;
histogram(X,h);
xlabel('nbre symbole de source ');
ylabel('DENSITE DE PROBABILITE');
title('');
grid;
frequence=histogram(X,h);
Lf=length(frequence);
P=zeros(1,M);
I=zeros(1,M);
j=1;
for i=1:Lf
    if frequence(i)>0
        P(j)=frequence(i);
        j=j+1;
        
    end
end
P=P/N;
%calcul de l'information
I=-log2(P);
%calcul de l'entropie
H=0;
for i=1:M
    H=H-P(i)*log2(P(i));
end
H;