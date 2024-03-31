%Arytmetyka zespolona
clc, clearvars

%Biegunowe, kartezjańskie, trygonometryczne
syms e;
z2=1+sqrt(3)*i;
z2=abs(z2)*e^(angle(z2)*i)
%z2=real(z2)+imag(z2)*i 
z=(sym(1)+i)^i
z_k=real(z)+i*imag(z)
z_t=abs(z)*(cos(angle(z))+i*sin(angle(z)))
z_b=abs(z)*exp((i*angle(z)))

%Suma szeregu
syms z n;
cn=(((3+i)*z)/(4-i))^n;
assume(abs(((3+i)*z)/(4-i))<1);
s3=symsum(cn,n,0,Inf)

%Exponent zespolony
Exp(z)=exp(real(z))*(cos(imag(z))+i*sin(imag(z)));
z=solve(Exp(z)==2-3i, z, "ReturnConditions", true)

%Pierwiastkowanie
syms u w;
assume(abs(u)==3);
w=solve(w^5==u, w);
w3=double(subs(w,u,3)) 

%Sin i cos
syms z;
syms x y real;
Sin(z)=(Exp(z*i)-Exp(-z*i))/2i;
Cos(z)=(Exp(z*i)+Exp(-z*i))/2;
z=x+1i*y;
equ1 = Cos(z)==cos(x)*cosh(y)-1i*sin(x)*sinh(y);
equ2 = Sin(z)==sin(x)*cosh(y)+1i*cos(x)*sinh(y);
simplify(equ1)
simplify(equ2)

%Logarytm wielowartościowy
syms z;
syms k integer;
pi=sym(pi);
mlog=@(z) log(abs(z))+i*(angle(z)+2*k*pi);
%logarytm główny: log= @(z) log(abs(z))+i*angle(z);
%a-gałąż logarytmu: Log_a=@(z) log(abs(z))+i*(mod(angle(z)-a, 2*pi)+a);
z=sym([2i-3;-3-3i;5*exp(i*pi/7);-3]);
w=mlog(z)

%Potęgowanie
syms z;
syms t real positive;
pi=sym(pi);
Log(z)=log(abs(z))+i*(mod(angle(z)+pi/2,2*pi)-pi/2);
resp1=exp(7/8*Log(-t))

%Injektyność funkcji
syms z w
pi=sym(pi);
conditions_for_sin=solve(sin(z)==sin(w),z,'ReturnConditions',true);
conditions_for_cos=solve(cos(z)==cos(w),z,'ReturnConditions',true);

D_s=simplify(real(z)>-pi/2 & real(z)<pi/2)
D_c=simplify(real(z)>0 & real(z)<pi)