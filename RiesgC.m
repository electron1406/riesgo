function [deltaSOC] = RiesgC(Variable_in,BATT,PV,I)
%Ayuda-leyenda
%deltaSOC_r=la diferencia del estado de la carga de las bater�as
%Variables de entrada
%Variable_in= es una tabla(matriz) que contiene todos los valores a estudiar
%BATT=vector columna de la variaci�n de la bater�a
%PV=vector columna de la variaci�n de las placas
%I=El valor de irradiaci�n que se contrasta

%La WEA es MUY de pinga en Chile

aux1 = Variable_in(Variable_in(:,10) == BATT,:); %%%%Este auxiliar carga 
                                                 %%%toda la tabla 64*10, yo 
                                                 %%cre�a que s�lo tenia que 
                                                 %%cargar la columna (12) 
                                                 %%baterias
aux2 = aux1(aux1(:,9) == PV,:);   %%%%Este auxiliar carga toda la tabla 64*10,
                                  %%%yo cre�a que s�lo tenia que cargar la 
                                  %%%columna (11) placas

auxD = aux2(:,[2;4;6;8]);  %%%LA estamos probando con 4 puntos despreciando el MODE
auxI = aux2(:,[1;3;5;7]);  %%%%LA estamos probando con 4 puntos (min, mediam, mean, Max)

[recta, Coef_deter]=linregr(auxI,auxD); %%%%a trav�s de esta funcion se calculan los coeficientes del sistema
deltaSOC = recta(1)*I+recta(2);

end
% function [deltaSOC] = RiesgC(Variable_in,BATT1,PV1,I)
% aux1 = Variable_in(Variable_in(:,12) == BATT1,:); %%%%Este auxiliar carga toda la tabla 100*12, yo cre�a que s�lo tenia que cargar la columna (12) baterias
% aux2 = aux1(aux1(:,11) == PV1,:);   %%%%Este auxiliar carga toda la tabla 100*12, yo cre�a que s�lo tenia que cargar la columna (11) placas
% 
% auxD = aux2(:,[2;4;6;8;10]);  %%%%Aqu� se cargan los perfiles de SOC para cada uno de los escenarios en una matriz (100*5)
% auxI = aux2(:,[1;3;5;7;9]);     %%%%Aqu� se cargan los perfiles de irradiaci�n Solar  de cada uno de los escenarios en una matriz (100*5)
% 
% p = polyfit(auxI(1,:),auxD(1,:),1); %%%%a trav�s de esta funcion se calculan los coeficientes del sistema
% deltaSOC = polyval(p,I);
% end