%Section 1
%matrices and vectors
clc
clearvars

x=1:4:10;
x.^2;
x(end);
%y=linspace(0,10,6)
%z=[3,4,5,2]

A = [2,3,4;3,4,7;1,0,2]
A^(-1);
B=eye(3);

%whos

A(2,2)
A(3,1:2)

%% Section 2
%example
clc, clearvars, close all

x=linspace(0,5);
%y= (-(x-3).^2)+10;

%anonynomus function:
y= @(x) (-(x-3).^2)+10;
%plot(x,y)

%max(y)
%[MaxVal, I]=max(y)
%x_of_maxval=x(I)
%[MinVal, J]=min(y)
%x_of_min_val=x(J)
%>>help min
%>>doc min
whos
y(20.7)

%% Section 3
clc, clearvars, close all

x=linspace(-10,10);
y1=(-(x-3).^2)+10;
y2=(-(x-3).^2)+15;
y3=(-(x-5).^2)+10;

%figure(1)
subplot(1,3,1)
plot(x,y1, "m*", "MarkerSize",4)
xlabel('x'), ylabel('y'), title("Problem A")
grid on

%hold on
subplot(1,3,2)
plot(x,y2, "b")
xlabel('x'), ylabel('y'), title("Problem A")
grid on

%hold on
subplot(1,3,3)
plot(x,y3, "g")
xlabel('x'), ylabel('y'), title("Problem A")
grid on

%legend("y1", "y2", "y3")
%xlim([-8,2]), ylim([-100,0])

%% Section 4
%sin
clc, clearvars, close all

%parameters
max_x=6.3
x=linspace(0,max_x, 100000);
y=sin(x);
y_check=0.8;

plot(x,y, ".")
hold on
plot([0,max_x],[y_check,y_check], "r")
y_greater = y>y_check;

FinalPercent = sum(y_greater)*100/length(y)

%% Section 5
%if vs for, time measurement

clc, clearvars
A=randi(5,1,10000000);

%if
tic
num3_if=sum(A==3)

if num3_if>=0.2*length(A)
    disp('wow')
end
time_if=toc

%for

tic
num3_for=0;
for i = 1:length(A)
    if A(i)==3
        num3_for = num3_for+1;
    end
end
num3_for
if num3_for>=0.2*length(A)
    disp('wow')
end
time_for=toc

%% Section 6
%while

clc, clearvars

z=75;
reduce_z(z)

disp("loop ended!")

