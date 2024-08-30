clc; close all; clear;


fprintf('Solu��es aproximadas para (P) com h= 1/10: \n');
disp (MEF (9)) %roda a fun��o abaixo para n=9

fprintf('Solu��es aproximadas para (P) com h= 1/20: \n');
disp(MEF (19)) %roda a fun��o abaixo para n=19

fprintf('Solu��es aproximadas para (P) com h= 1/40: \n');
disp(MEF (39)) %roda a fun��o abaixo para n=39

%legenda do gr�fico que compara as solu��es 
legend('h = 1/10','h = 1/20','h = 1/40'); 

%fun��o que aplica o m�todo 
function [uh] = MEF(n)

    %dados e parti��o: f(x) = w(x)/T = w(x)
    f = @(x) 1 + sin(4*pi*x);
    h =(1-0)/(n+1); x = (0:h:1); %h em fun��o de cada n
    k = 0.1; % k=0.1
    
    %Matrizes e solu��o num�rica
    e = ones(n,1);
    K = (1/h)*spdiags([-e 2*e -e], -1:1,n,n); %Matriz K
    M = (h/6)*spdiags([e 4*e e], -1:1,n,n); %Matriz M
    A = K + k*M; %Matriz A
    b = h*f(x(2: end -1)); %Vetor b
    uh = A\b'; uh = [0; uh; 0]; %Solu��o
    
    %Gr�ficos para h = 1/10, 1/20, 1/40
    hold on
    plot(x,uh)
    hold off

end
