% Wyznaczanie stopnia wielomianu
% o wsp�czynikach liczbowych

/*
Definicja: rekurencja strukturalna

1) st(x)=1
   st(c)=0, gdzie c - liczba

2) Stopnie wielomian�w z�o�onych okre�lamy nast�puj�co:
   st(-w)=st(w),
   st(w1+w2)=st(w1-w2)=max(st(w1),st(w2)),
   st(w1*w2)=st(w1)+st(w2),
   st(w^N)=st(w)*N (N-liczba naturalna, N>1)
*/

% st_wielomian(W,X,N)
% spe�niony, gdy N jest stopniem wielomianu w
% zmiennej X o wsp�czynnikach liczbowych
% definicja rekurencyjna
% warunki zako�czenia rekurencji
st_wielomian(X,X,1).
st_wielomian(C,_,0):-number(C).

% rekurencja
st_wielomian(-W,X,N):-st_wielomian(W,X,N).
st_wielomian(W1+W2,X,N):-st_wielomian(W1,X,N1),st_wielomian(W2,X,N2),N is max(N1,N2).
st_wielomian(W1-W2,X,N):-st_wielomian(W1,X,N1),st_wielomian(W2,X,N2),N is max(N1,N2).
st_wielomian(W1*W2,X,N):-st_wielomian(W1,X,N1),st_wielomian(W2,X,N2),N is N1+N2.
st_wielomian(W^M,X,N):-integer(M),M>1,st_wielomian(W,X,M1),N is M1*M.
