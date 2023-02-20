%part1: Test sans bruit:
%generation des Nb bits:
alt=randi([0 1],100,4);
%la matrice generatrice:
G=[1 0 0 0 1 1 0; 0 1 0 0 0 1 1; 0 0 1 0 1 1 1; 0 0 0 1 1 0 1];
%codage de la series generee:
MSG_CODE = encode(alt, 7, 4, 'linear', G);
%decodage de la serie generee:
MSG = decode(MSG_CODE, 7, 4,'linear', G);
%verification:
for i = 1:400
    comparexor=0;
    comparexor(i)=xor(MSG_CODE(i), MSG(i));
end
if comparexor==zeros(1,400)
    disp('there is no error');
else
    disp('error in decoding');
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %part2:Test avec bruit
clear;clc;
Nb=400000;
err=zeros(8);
err1=zeros(8);
P=[0 1 2 3 4 5 6 7];
G=[1 0 0 0 1 1 0; 0 1 0 0 0 1 1; 0 0 1 0 1 1 1; 0 0 0 1 1 0 1];
    for p=0:7
        MSG=randi([0 1], 100000, 4);
        Q=qfunc(2*4/7*sqrt(2*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
        MSG_CODE=encode(MSG_CAN, 7, 4, 'linear/binary', G);
        E=0;
        while E<100
            C=0;
            MSG_RETOUR=decode(MSG_CODE, 7, 4, 'linear/binary', G);
        for i=1:Nb
            if MSG(i) ~= MSG_RETOUR(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err(p+1)=E/Nb;
    end
err;
    for p=0:7
        MSG=randi([0 1], 100000, 4);
        Q=qfunc(2*4/7*sqrt(2*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
        E=0;
        while E<100
            C=0;
        for i=1:Nb
            if MSG(i) ~= MSG_CAN(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err1(p+1)=E/Nb;
    end
err1;

semilogy(P, err);
hold on
semilogy(P, err1);
legend('avec codage','sans codage')
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%part 3:
clc;clear;
Nb=400000;
err=zeros(8);
err1=zeros(8);
P=[0 1 2 3 4 5 6 7];
    for p=0:7
        MSG=randi([0 1], 100000, 4);
        Q=qfunc(sqrt(2*4/7*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
        MSG_CODE=encode(MSG_CAN, 7, 4, 'cyclic', cyclpoly(7,4));
        E=0;
        while E<100
            C=0;
            MSG_RETOUR=decode(MSG_CODE, 7, 4, 'cyclic', cyclpoly(7,4), syndtable(cyclgen(7,cyclpoly(7,4))));
        for i=1:Nb
            if MSG(i) ~= MSG_RETOUR(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err(p+1)=E/Nb;
    end
err;
    for p=0:7
        MSG=randi([0 1], 100000, 4);
        Q=qfunc(sqrt(2*4/7*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
        E=0;
        while E<100
            C=0;
        for i=1:400000
            if MSG(i) ~= MSG_CAN(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err1(p+1)=E/Nb;
    end
err1;

semilogy(P, err);
hold on
semilogy(P, err1);
legend('avec codage','sans codage');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%part 4:
clc;clear;
trellis = poly2trellis(3, [5 7]);
D= 5;
Nb=100;
err=zeros(8);
err1=zeros(8);
P=[0 1 2 3 4 5 6 7];
    for p=0:7
        MSG=randi([0 1], 1, 100);
        Q=qfunc(sqrt(2*4/7*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
       MSG_CODE = convenc(MSG, trellis);
        E=0;
        while E<5
            C=0;
            MSG_RETOUR=vitdec(MSG_CODE,trellis,D,'trunc','hard');
        for i=1:Nb
            if MSG(i) ~= MSG_RETOUR(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err(p+1)=E/Nb;
    end
err;
    for p=0:7

        MSG=randi([0 1], 1, 100);
        Q=qfunc(sqrt(2*4/7*10^(p/10)));
        MSG_CAN= bsc(MSG,Q);
        E=0;
        while E<5
            C=0;
        for i=1:100
            if MSG(i) ~= MSG_CAN(i)
            C=C+1;
            end
        end
        E=E+C;
        end
    err1(p+1)=E/Nb;
    end
err1;

plot(P, err);
hold on
plot(P, err1);
legend('avec codage','sans codage');