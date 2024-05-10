% podwojenie (+L1,?L2).
% spe�niony, gdy element listy L2 podwojeniami
% element�w listy L1, np. L1=[a,b], L2=[a,a,b,b]
% ---------------------------------------
%
% warunek ko�cz�cy rekurencj�: podwojenie listy pustej
% jest lista pust�.

podwojenie([],[]).

% rekurencja:

podwojenie([H1|T1],[H1,H1|T2]):-
    podwojenie(T1,T2).