%Matlab - summary of subject
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Entering data

syms x y %symbolic variables
disp('Text')
x=10
y=10; %the ";" makes it not shown in terminal


%Tricky functions
sind(15) %sin in degrees
exp(x) %e^x
double(a) %makes type of a double, same with syms(a)
fix(t) %rounds t
simplify(x)  
fimplicit(x) 


%Assume, solve

syms a
assume((imag(a)==0))
%or we could use a=a(imag(a)==0)
eqn = (a)*(a/2)*(a/4)==4/3*pi*24^3;
a1=double(solve(eqn, a))


%Plotting

syms x
g=x^2
h=x+7
fig=figure;
fplot(g,[-3,5])  %plots g(x) for x in range [-3,5]
xlabel("x")
ylabel("t")
title("Plot of g and h")
hold on  %allows to draw more than 1 function on the same plot
fplot(h,[-3,5])
ylim([0,10])


%%
%Creating arrays
row=[1,2,3,4,5] %or [1 2 3 4 5] (commas aren't necessary)
column=[1;2;3;4;5]
linspace(0,15,6) %6 points equally distanced
row=1:3:43 %step=6
column=(1:3:43)' %transposed vector


%Matrices

    %columns/rows -> matrix
a=[3 -1 5 11 -4 2]; b=[7 -9 2 13 1 -2]; c=[-2 4 -7 8 0 9];
matrixA=[a;b;c]
matrixB=[a', b',c'] %or [a;b;c]'
matrix_sliced = [a(1:3); b(1:3); c(1:3)]'

vec=1:18;
A=reshape(vec,3,6)

    %matrix -> columns/rows
A=[36:-2:26; 24:-2:14; 12:-2:2];
vec=A(2,1:6) %row, column
col=A(1:3,6)

    %matrix -> matrix
E=[0.1:0.2:1.1;12:-3:-3;6:11]
F=E(2:3, 3:5)

H=[1.25:0.25:2.75; 1:3, 1:4; 45:-5:15]
G=[H(1, [1:3, 6:7]); H(3, 3:7)]
K=H(:, [2,3,5,7])'  % ":" means full row


%Matrices - eye, ones, zeros

A=ones(2,3) %matrix with 2 rows and 3 columns, full of "1"
B=zeros(2,3) %matrix with 2 rows and 3 columns, full of "0"
C=eye(4) %identity matrix, 4 rows and 4 columns

    %we can merge matrices:
B=[eye(2), zeros(2,2), ones(2,2)]
F=[zeros(4,1), [ones(2,3); zeros(2,3)], [zeros(2,1); ones(2,1)]]


%%
%Symbolic math


%Basic operations
syms x y
S=(2*x^2+y^2)*(x+y^2+3)
F=collect(S)   %group x terms: 2*x^3 + (2*y^2 + 6)*x^2 + y^2*x + y^2*(y^2 + 3)
H=collect(S,y) %group y terms: y^4 + (2*x^2 + x + 3)*y^2 + 2*x^2*(x + 3)
K=expand(S)    %expand fully: 2*x^3 + 2*x^2*y^2 + 6*x^2 + x*y^2 + y^4 + 3*y^2

S2=x^3+4*x^2-11*x-30
L=factor(S2)  %row of factors: [x + 5, x - 3, x + 2]


%Subs (substituting)

syms a b
S=a*x+b
resp = subs(S,[a,b],[3,2])  %resp=3x+2


%Solving equations (solve)
syms x y t
S=10*x+12*y+16*t;
eqn =[S==0 5*x-y==13*t]
sol=solve(eqn,[x,y])
sol.x
sol.y

    %easier example:
eqn = 2*a+3==9;
a1=solve(eqn, a)


%Derivatives & integrals

syms t x(t)

dx=diff(x,t)
ddx=diff(x,t,2)  %second derivative
ix=int(x,t)
numint=int(x,0,1)  %definite integral, from 0 to 1


    %Cauchy problem
syms t x(t)
eqn=diff(x,t)==t^2
cond=x(0)==3
s=dsolve(eqn, cond)