% podwojenie (+L1,?L2).
% spe³niony, gdy element listy L2 podwojeniami
% elementów listy L1, np. L1=[a,b], L2=[a,a,b,b]
% ---------------------------------------
%
% warunek koñcz¹cy rekurencjê: podwojenie listy pustej
% jest lista pust¹.

podwojenie([],[]).

% rekurencja:

podwojenie([H1|T1],[H1,H1|T2]):-
    podwojenie(T1,T2).
