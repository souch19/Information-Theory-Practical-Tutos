% initialisation:
Alpha= [1 2 3];
Seq=[3 3 1 3 3 3 3 3 2 3];
%compression avec huffman
nb_1=0;
nb_2=0;
nb_3=0;
%calcul de probabilites:
prob_occ=[0 0 0];
for i=1:length(Seq)
    if(Seq(i)==1)
        nb_1=nb_1+1;
    elseif (Seq(i)==2)
        nb_2=nb_2+1;
    else
        nb_3=nb_3+1;
    end
end
%creation du dictionnaire :
prob_occ=1/10 * [nb_1 nb_2 nb_3];
dict=huffmandict(Alpha, prob_occ);
dict;
%codage du messsage:
 enco_huff=huffmanenco(Seq,dict);
enco_huff;
%decodage:
decode_huff=huffmandeco(enco_huff, dict);
%comparaison 
diff=length(Seq)*8-length(enco_huff);
diff;
if (diff>0)
    display("le compresseur de huffman nous a permet de gagner de l'espace")
end 
%compression avec arithmetique:
counts = [1 1 8];
 enco_arth=arithenco(Seq, counts);
enco_arth;
len=length(Seq);
decode_arth=arithdeco(enco_arth, counts, len);
decode_arth;
%comparaison 2
diff_1=length(Seq)*8-length(enco_arth);
diff_1;
if (diff_1>0)
    display("le compresseur arithmetique nous a permet de gagner de l'espace")
end 
% Q7: on calcule la difference entre la taille du code pour huffman et
% arithmetique: on trouve que huffman est mieux
if(length(enco_huff)<length(enco_arth))
    display("le codage de huffman est le meilleur")
else 
    display("le codage arithmetique est le meilleur")
end
%lecture du fichier
TP=importdata('tp.txt');
%transformation de la chaine de caracteres en un vecteur de char
symboles = char(TP);
%trouver les nombres d'occurrences pour chaque caractere: on utilise count
%on a considere que a=A ...
nb_a=count(symboles,'a','ignoreCase',true);
nb_b=count(symboles,'b','ignoreCase',true);
nb_c=count(symboles,'c','ignoreCase',true);
nb_d=count(symboles,'d','ignoreCase',true);
nb_e=count(symboles,'e','ignoreCase',true);
nb_f=count(symboles,'f','ignoreCase',true);
nb_g=count(symboles,'g','ignoreCase',true);
nb_h=count(symboles,'h','ignoreCase',true);
nb_i=count(symboles,'i','ignoreCase',true);
nb_j=count(symboles,'j','ignoreCase',true);
nb_k=count(symboles,'k','ignoreCase',true);
nb_l=count(symboles,'l','ignoreCase',true);
nb_m=count(symboles,'m','ignoreCase',true);
nb_n=count(symboles,'n','ignoreCase',true);
nb_o=count(symboles,'o','ignoreCase',true);
nb_p=count(symboles,'p','ignoreCase',true);
nb_q=count(symboles,'q','ignoreCase',true);
nb_r=count(symboles,'r','ignoreCase',true);
nb_s=count(symboles,'s','ignoreCase',true);
nb_t=count(symboles,'t','ignoreCase',true);
nb_u=count(symboles,'u','ignoreCase',true);
nb_v=count(symboles,'v','ignoreCase',true);
nb_w=count(symboles,'w','ignoreCase',true); 
nb_x=count(symboles,'x','ignoreCase',true);
nb_y=count(symboles,'y','ignoreCase',true);
nb_z=count(symboles,'z','ignoreCase',true);
nb_points=count(symboles,'.','ignoreCase',true);
nb_ver=count(symboles,',','ignoreCase',true);
nb_semicol=count(symboles,';','ignoreCase',true);
%pour les espaces on va utiliser la fonction : isstrprop(TEXT, type)
nb_spaces=0;
B = isstrprop(symboles, 'wspace');
for i=1:length(B)
 nb_spaces=nb_spaces+B(i);
end
nb_spaces;
%definition du vecteur de probabilites
P=1/length(symboles)*[nb_a nb_b nb_c nb_d nb_e nb_f nb_g nb_h nb_i nb_j nb_k nb_l nb_m nb_n nb_o nb_p nb_q nb_r nb_s nb_t nb_u nb_v nb_w nb_x nb_y nb_z nb_spaces ];
%calcul de P totale
p_totale=0;
for i=1:length(P)
 p_totale=p_totale+P(i);
end
p_totale;

if (p_totale ~= 1)
    display("error");
else
    display("everything is okey");
end
%on doit utiliser un tableau sans valeurs nulles pour qu'on puisse calculer
%l'entropie et l'information , alors on utilise la fonction find avec la condition P(i)<>0 et
%on stoque ces valeurs dans un vecteur P_not_null
P_not_null = P(find(P>0));
% calcul de l'information propre:
Info=-log2(P_not_null);
Info;
%definir le vecteur de valeur possibles
alphabets=[97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 32] ;
%convertir la chaine en code ascii
conv=abs(symboles);
%calcul de probabilite
P_conv=P;
%le codage de chaque symbole
M_code=huffmandict(alphabets, P_conv);
%codage du message complet
encodage=huffmanenco(symboles,M_code);
%sauvgarde du resultat dans un fichier .txt
%decodage de la sequence par huffmandeco:
decodage=huffmandeco(encodage, M_code);
%conversion du code numerique vers ascii
decod_ascci=char(decodage);
% calcul de l'entropie:
h=0;
for i=1:length(P_not_null)
 h=h-P_not_null(i)*log2(P_not_null(i));
end
%calcul de la longueur moyenne:
%on va d'abords savoir le nombre de bits pour chaque symbole:
for i=1:length(M_code)
longueur_par_symbole(i)=length(M_code{i,2});
end
longueur_par_symbole;
longueur=0;
for i=1:length(M_code)
    longueur=longueur+P(i)*longueur_par_symbole(i);
end
if(h>longueur)
    display("error");
else
    display("it is okey");
end
%calcul d'efficacite et redondance du code:
%on a efficacite= H/longueur moyenne * 100
%on redondance= 1-efficatcite:

eff=h/longueur *100;
red=100-eff;
%calcul du taux de compression:
taille_apres_compression=length(encodage);
%on considere qu'on code un symbole sur 8 bits
taille_avant_compression=length(symboles)*8;
Tc=taille_apres_compression/taille_avant_compression * 100;
%calcul du gain de compression:
Gain=100-Tc;

