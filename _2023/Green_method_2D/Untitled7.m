clear
close all
clc

L = 10;         % Длина балки
E = 2e11;       % Модуль Юнга
I = 8.33e-6;    % Момент инерции
q = 0;          % Распределенная нагрузка
F = 10000;      % Сосредоточенная нагрузка
x0 = 0;         % Начальное положение
xf = L;         % Конечное положение
y0 = 0;         % Начальное положение
yf = 0;         % Конечное положение

% Определяем функцию распределенной нагрузки
q_fun = @(x) q;

% Определяем функцию сосредоточенной нагрузки
F_fun = @(x) F*(x==xf);

% Определяем функцию правой части системы дифференциальных уравнений
f = @(x,y) [y(2); y(3); y(4); (q_fun(x)+F_fun(x))/(E*I)];

% Решаем систему дифференциальных уравнений
options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
dy0 = 0;
[x,y] = ode15s(f, [x0,xf], [y0,dy0,0,0], options);

% Отображаем результаты
plot(x,y(:,1))
xlabel('x, м')
ylabel('y, м')
title('Прогиб балки')
