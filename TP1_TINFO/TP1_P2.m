%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%partie2
%creation du vecteur
symboles="On peut tout te prendre; tes biens, tes plus belles années, l'ensemble de tes joies, et l'ensemble de tes mérites, jusqu'à ta dernière chemise. Il te restera toujours tes rêves pour réinventer le monde que l'on t'a confisqué.";
%nombre d'elements dans le vecteur
%on utilise soit la fonction strlength()
len=strlength(symboles);
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
nb_j=count(symboles,'g','ignoreCase',true);
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
nb_point=count(symboles,'.','ignoreCase',true);
nb_vir=count(symboles,',','ignoreCase',true);
nb_e_accent_aigu=count(symboles,'é','ignoreCase',true);
nb_e_accent_grave=count(symboles,'è','ignoreCase',true);
nb_e_accent_circonflexe=count(symboles,'ê','ignoreCase',true);
nb_a_accent=count(symboles,'à','ignoreCase',true);
nb_semi_col=count(symboles,';','ignoreCase',true);
%pour les espaces on va utiliser la fonction : isstrprop(TEXT, type)
nb_spaces=0;
B = isstrprop(symboles, 'wspace');
for i=1:length(B)
    nb_spaces=nb_spaces+B(i);
end
nb_spaces;
%definition du vecteur de probabilites
P=1/len*[nb_a nb_b nb_c nb_d nb_e nb_f nb_g nb_h nb_i nb_g nb_k nb_l nb_m nb_m nb_n nb_o nb_p nb_q nb_r nb_s nb_t nb_u nb_v nb_w nb_x nb_y nb_z nb_point nb_vir nb_e_accent_aigu nb_a_accent nb_semi_col nb_e_accent_grave nb_e_accent_circonflexe nb_spaces];
p_totale=0;
for i=1:length(P)
    p_totale=p_totale+P(i);
end
p_totale;
if p_totale<1
    disp('error, la somme des probabilites est <1');
end
%pour fixer ce probleme on peut ajouter une probabilite qui represente les
%caracteres restants comme suit :
%nb_reste=1-p_totale;
%on peut aussi ajouter cette colonne au vecteur de probabilites comme suit:
%P=1/len*[nb_a nb_b nb_c nb_d nb_e nb_f nb_g nb_h nb_i nb_g nb_k nb_l nb_m nb_m nb_n nb_o nb_p nb_q nb_r nb_s nb_t nb_u nb_v nb_w nb_x nb_y nb_z nb_point nb_vir nb_e_accent_aigu nb_a_accent nb_semi_col nb_e_accent_grave nb_e_accent_circonflexe nb_spaces nb_reste*len];
%on peut revifier maintenant et ca va donner que la somme des Pi est 1
%p_totale=p_totale+P(length(P));
%if p_totale<1
 %   disp('error, la somme des probabilites est <1');
%elseif p_totale==1 
 %   disp('everything is okey');
%end
%calcul de l'information propre:
Info_totale=-log2(p_totale);
Info_totale;
%on doit utiliser un tableau sans valeurs nulles pour qu'on puisse calculer
%l'entropie, alors on utilise la fonction find avec la condition P(i)<>0 et
%on stoque ces valeurs dans un vecteur P_not_null
P_not_null = P(find(P~=0));
%calcul de l'information propre par symbole:
Info=-log2(P_not_null)
Info
%calcul de l'entropie:
h=0;
for i=1:length(P_not_null)
   h=h-P_not_null(i)*log2(P_not_null(i));
end
h
%calcul de l'entropie dans le cas de symboles equiprobables
%cas de vecteur P ayant des probabilites nulles :
h_equiprobable_null=log2(length(P))
h_equiprobable_null
%cas de vecteur P ayant des probabilites nulles :
h_equiprobable=log2(length(P_not_null))
h_equiprobable
%mesure de l'efficacite
efficacite = h/h_equiprobable;
efficacite
%efficacite en %
efficacite*100 
%mesure de la redondance:
%  on utilise 1-efficacite
redondance=1-efficacite;
redondance*100
