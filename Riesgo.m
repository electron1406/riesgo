function [d,SOC_r,deltaSOC_r] = Riesgo(Variable_in,BATT,PV,I)
%Ayuda
%Variables de salida
%d =n�mero de d�as
%SOC_r=el estado de carga de la bater�a
%detaSOC_r=la diferencia del estado de la carga
%Variables de entrada
%Variable_in= es una tabla(matriz) que contiene todos los valores a estudiar
%BATT=vector columna de la variaci�n de la bater�a
%PV=vector columna de la variaci�n de las placas
%I=El valor de irradiaci�n que se contrasta

NMUESTRAS = length (I); % N�mero de muestras de irradiacion diaria en el dataset
SOC_r = ones(NMUESTRAS,1);
deltaSOC_r = ones(NMUESTRAS,1);
d = 1;
SOC_r(1) = 70;
deltaSOC_r(1) = 0;
while (SOC_r(d) >= 30 && d <= NMUESTRAS)
    deltaSOC_r(d) = RiesgC(Variable_in,BATT,PV,I(d));
    SOC_r(d+1) = min(SOC_r(d)+deltaSOC_r(d),98.5);
    d = d+1;
end
% end