% R2 es la resistencia que esta conectada a la resistencia de 47k y el
% capacitor de 10n

clear all

eq1 = '-1 == i1 * (22e3 + 1/(6.8e-9 * s)) - i3/(6.8e-9 * s)';
eq2 = ' 1 == i2 * (47e3 + 1/(10e-9 * s)) - i3 * 47e3';
eq3 = ' 0 == -i1 / (6.8e-9*s) - i2 * 47e3 + i3 * (97e3 + 1/(6.8e-9 * s)) ';
eq4 = ' T == i2/(10e-9 *s) + i3*R2 ';
resultado = solve(eq1, eq2, eq3, eq4,  'i1', 'i2', 'i3', 'T');
T = resultado.T;

s = 1:1e6;
R = 0:10e3:50e3;
colores = 'rgbkym';
leyenda = cell(length(R),1);

for i = 1:length(R)
    R2 = R(i);
    sistema = subs(T);
    color = colores(i);
    semilogx(s,sistema, color);
    leyenda{i} = sprintf('R2 = %d Ohm',R2);
    hold on;
end
legend(leyenda, 'Location', 'NorthWest');
ylabel('Amplificacion');
xlabel('frecuencia [Hz]');
