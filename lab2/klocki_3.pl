/* definiujemy relacj� nad(X,Y), spe�nion�, gdy klocek X le�y nad klockiem Y
(nieko�ecznie bezpo�rednio) */

na(d,c).
na(c,a).
na(c,b).
na(a,e).
na(b,g).
nad(X,Y):-na(X,Y).
nad(X,Y):-na(X,Z),nad(Z,Y).

/* Czy klocek d le�y na b?
?-nad(d,b).
true
false. */
