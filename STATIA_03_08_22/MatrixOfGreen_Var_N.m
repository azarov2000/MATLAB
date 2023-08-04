function [w] = MatrixOfGreen_Var_N(System_name,N)

global zi ze Ze Zte beta betaR muR
global L E S I Z EC E1 EL h DE
  
%--------------------------------------
%% Заполнение матриц 
G00=zeros(L);G01=zeros(L);
G10=zeros(L);G11=zeros(L);
G00Int=zeros(L);G01Int=zeros(L);
G10Int=zeros(L);G11Int=zeros(L);

% Получений матриц Грина для внеинтегральных и интегральных слагаемых
for j=1:L
    for k=1:L
     [G00(j,k),G01(j,k),G10(j,k),G11(j,k)]=MatrixOfGreen(j,k,System_name,h);
     [G00Int(j,k),G01Int(j,k),G10Int(j,k),G11Int(j,k)]=MatrixOfGreenInt(j,k,System_name,h);
    end
end
%% Заполнение матриц коэффициентов
%aksi=kron(I,E)+2*zi*h*N*kron(G00Int,S);
%dksi=kron(Z,E);
%ateta=2*zi*h*N*kron(G10Int,S);
%dteta=kron(I,S);
aksi=kron(I,E+2*zi*N*S);
dksi=kron(Z,E);
ateta=kron(Z,E);
dteta=kron(I,S-2*zi*N*E);


% bksi=2*h*(zi+ze)*kron(G00Int,E)+2*Ze*kron(G00*EC,E);
% eksi=-2*betaR*N*h*kron(G01Int,E)+2*betaR*N*kron(G00*EL,E)-...
%     -2*betaR*N*kron(G00*E1,E)-2*beta*N*kron(G01*EC,E)+...
%     +2*Zte*kron(G01*EC,S);
% bteta=2*h*(zi+ze)*kron(G10Int,E)+2*Ze*kron(G10*EC,E);
% eteta=-2*betaR*N*h*kron(G11Int,E)+2*betaR*N*kron(G10*EL,E)-...
%     -2*betaR*N*kron(G10*E1,E)-2*beta*N*kron(G11*EC,E)+...
%     +2*Zte*kron(G11*EC,S);
bksi=kron(2*zi*I+2*ze*h*G00Int+2*Ze*G00*EC,E);
eksi=kron(2*betaR*N*(-h*G01Int+G00*DE)+2*beta*N*G01*EC,E)+kron(2*Zte*G01*EC,S);
bteta=kron(2*ze*h*G10Int+2*Ze*G10*EC,E);
eteta=kron(2*betaR*N*(-h*G11Int+G10*DE)+2*beta*N*G11*EC,E)+kron(2*zi*I+2*Zte*G11*EC,S);



% cksi=muR*h*kron(G00Int,E)+kron(G00*EC,E);
% fksi=betaR*kron(G00*(E1-EL),S)+betaR*h*kron(G01Int,S)+beta*kron(G01*EC,S);
% cteta=muR*h*kron(G10Int,E)+kron(G10*EC,E);
% fteta=betaR*kron(G10*(E1-EL),S)+betaR*h*kron(G11Int,S)+beta*kron(G11*EC,S);
cksi=kron(muR*h*G00Int+G00*EC,E);
fksi=kron(betaR*(h*G01Int-G00*DE)+beta*G01*EC,S);
cteta=kron(muR*h*G10Int+G10*EC,E);
fteta=kron(betaR*(h*G11Int-G10*DE)+beta*G11*EC,S);

A0=[aksi dksi;ateta dteta];

A1=[bksi eksi;bteta eteta];

A2=[cksi fksi; cteta fteta];


[w]=polyeig(A0,A1,A2); % Нахождение собственных значений
    
   
end