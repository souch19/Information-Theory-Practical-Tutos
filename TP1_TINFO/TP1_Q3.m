%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Q3
M=8;
symbols=[0: M-1];
Pz=[0.0078 0.0625 0.2539 0.4713 0.1250 0.060 0.0156 0.0039];
z=randsrc(N,1, [symbols;Pz]);
histogram(z,h);
xlabel('nombre de symboles de source ');
ylabel('densite de probabilite');
title('programmation dune source ');
grid;
frequence=histogram(z,h);
Lf=length(frequence);
P=zeros(1,M);
Iz=zeros(1,M);
j=1;
for i=1:Lf
       if frequence(i)>0
        P(j)=frequence(i)/N;
        j=j+1;
       end
end
P;
Iz=-log2(P);
P_not_null = P(find(P~=0));
Hz
for i=1:length(P_not_null)
    Hz=Hz-P_not_null(i)*log2(P_not_null(i));
end
Hz