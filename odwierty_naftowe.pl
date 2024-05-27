% Program odwierty_naftowe
% Baza wiedzy z podstawowymi informacjami o odwiertach naftowych

% Definiowane predykaty:
%  odwiert/2
%  glebokosc/2
%  produkcja/2
%  gleboki/1
%  wydajny/1
%  info/3
%  ile_metrow_w_barylkach/2
%  ile_barylek_w_metrach/2
%  ile_litrow_w_barylkach/2
%  ile_ton/2
%  sumaryczna_produkcja/2
%  srednia_glebokosc/2
%  globalna_produkcja/1
%  najwieksza_produkcja/2
%  na_ladzie/1
%  odwierty_w_kraju/2
%  odwierty_w_zakresie_glebokosci/3
%
% =====================================================================

% odwiert(X,Y) opis: spe�niony gdy odwiert X znajduje si� w podanej
% lokalizacji Y

% glebokosc(X,Y)
% opis: spe�niony gdy odwiert X jest podanej g��boko�ci Y

% produkcja(X,Y)
% opis: spea�niony gdy odwiert produkuje podan� ilo�� ropy (w bary�kach
% na dzie�)

% gleboki(Odwiert)
% opis: spe�niony gdy odwiert X jest g��bszy ni� 3000 metr�w (G
% > 3000)

% wydajny(X)
% opis: spe�niony gdy odwiert X produkuje wi�cej ni� 10000 bary�ek
% dziennie

% info(X, Y, Z)
% opis: spe�nony gdy odwiert X, ma g��boko�� Y
% i produkuje Z bary�ek na dzie�

% ile_metrow_w_barylkach(X,Y)
% opis: spe�niony gdy ilo�ci bary�ek X odpowiada ilo�� metr�w
% sze�ciennych Y
% 1 bary�ka to 0,159 metr�w sze�ciennych

% ile_barylek_w_metrach(X,Y)
% opis: spe�niony gdy ilo�� metr�w sze�ciennych X odpowiada ilo�ci
% bary�ek Y
% 1 metr sze�cienny to ok 6,3 bary�ki

% ile_litrow_w_barylkach(X,Y)
% opis: spe�niony gdy ilo�� bary�ek X odpowiada ilo�ci litr�w
% 1 bary�ka to 159 litr�w

% ile_ton(X,Y)
% opis: spe�niony gdy ilo�� bary�ek ropy odpowiada ich wadze w tonach
% 1 tona ropy naftowej to 7,4 bary�ki

% sumaryczna_produkcja(X, Y)
% opis: spe�niony gdy sumaryczna produkcja ropy naftowej dla lokalizacji
% X wynosi Y

% srednia_glebokosc(X, Y)
% opis: spe�niony gdy dla daneh lokalizachi X, �rednia g��boko��
% odwiert�w wynosi Y

% globalna_produkcja(X)
% opis: spe�niony gdy suma produkcji wszystkich odwiert�w wynosi X

% najwieksza_produkcja(X, Y)
% opis: spe�niony gdy odwiert Y ma najwi�krz� produkcj� dla lokalizacji
% X

% na_ladzie(X)
% opis: spe�niony gdy odwiert X znajduje si� na londzie

% odwierty_w_kraju(X, Y)
% opis: spe�niony gdy odwierty z listy Y znajduj� si� w lokalizacji X

% odwierty_w_zakresie_glebokosci(X, Y, Z)
% opis: spe�niony gdy odwierty z listy Z wierc� w g��boko�ciach od X do
% Y

% ====================================================================

% Definicje fakt�w: odwierty naftowe i ich lokalizacja
odwiert(odw1, united_states).
odwiert(odw2, united_states).
odwiert(odw3, united_states).
odwiert(odw4, united_states).
odwiert(odw5, china).
odwiert(odw6, russia).
odwiert(odw7, mexico).
odwiert(odw8, mexico).
odwiert(odw9, north_atlantic_ocean).
odwiert(odw10, mexico).
odwiert(odw11, north_sea).

% Definicje fakt�w: g��boko�ci odwiert�w (w metrach)
glebokosc(odw1, 2200).
glebokosc(odw2, 2800).
glebokosc(odw3, 3000).
glebokosc(odw4, 3400).
glebokosc(odw5, 2500).
glebokosc(odw6, 2500).
glebokosc(odw7, 534).
glebokosc(odw8, 2438).
glebokosc(odw9, 2340).
glebokosc(odw10, 944).
glebokosc(odw11, 216).

% Definicje fakt�w: produkcja ropy (w bary�kach na dzie�)
produkcja(odw1, 6500).
produkcja(odw2, 3500).
produkcja(odw3, 3400).
produkcja(odw4, 5700).
produkcja(odw5, 4800).
produkcja(odw6, 90000).
produkcja(odw7, 60000).
produkcja(odw8, 100000).
produkcja(odw9, 1400).
produkcja(odw10, 100000).
produkcja(odw11, 600000).

% Regu�a sprawdzaj�ca, czy odwiert jest g��boki
% G��bokie odwierty to takie, kt�re maj� g��boko�� powy�ej 3000 metr�w
gleboki(X):-
    glebokosc(X, G),
    G > 3000.

% Regu�a sprawdzaj�ca, czy odwiert jest wydajny
% Wydajne odwierty to takie, kt�re produkuj� wi�cej ni� 10000 bary�ek na
% dzie�
wydajny(X):-
    produkcja(X, P),
    P > 10000.

% Regu�a zwracaj�ca g��boko�� i produkcj� danego odwiertu
info(X, Y, Z):-
    glebokosc(X, Y),
    produkcja(X, Z).

% Regu�a zwraca ile metr�w sze�ciennych pokrywa podana ilo�� bary�ek
ile_metrow_w_barylkach(X,Y):-
    Y is (X * 0.159).

% Regu�a zwraca ile bary�ek przypada na podane metry sze�cienne
ile_barylek_w_metrach(X,Y):-
    Y is (X * 6.3).

% Regu�a zwaraca ile litr�w mie�ci si� w podanej liczbie bary�ek
ile_litrow_w_barylkach(X,Y):-
    Y is (X * 159).

% Regu�a zwraca ile ton ropy mie�ci si� w podanej liczbie bary�ek
ile_ton(X,Y):-
    Y is (X / 7.4).

% Regu�a obliczaj�ca sumaryczn� produkcj� ropy naftowej dla danej lokalizacji
sumaryczna_produkcja(X, Y) :-
    findall(Produkcja, (odwiert(Odwiert, X), produkcja(Odwiert, Produkcja)), Produkcje),
    sum_list(Produkcje, Y).

% Regu�a obliczaj�ca �redni� g��boko�� odwiert�w dla danej lokalizacji
srednia_glebokosc(X, Y) :-
    findall(Glebokosc, (odwiert(Odwiert, X), glebokosc(Odwiert, Glebokosc)), Glebokosci),
    length(Glebokosci, N),
    sum_list(Glebokosci, Suma),
    Y is Suma / N.

% Regu�a pokazuje ��czn� produkcj�
globalna_produkcja(X) :-
    findall(Produkcja, produkcja(_, Produkcja), Produkcje),
    sum_list(Produkcje, X).

% Regu�a znajduj�ca odwiert o najwi�kszej produkcji w danej lokalizacji
najwieksza_produkcja(X, Y) :-
    produkcja(Y, Produkcja),
    odwiert(Y, X),
    \+ (produkcja(Inny, InnaProdukcja), InnaProdukcja > Produkcja, odwiert(Inny, X)).

% Regu�a sprawdzaj�ca, czy odwiert znajduje si� na l�dzie
na_ladzie(X) :-
    odwiert(X, Lokalizacja),
    \+ member(Lokalizacja, [north_atlantic_ocean, north_sea]).

% Regu�a zwracaj�ca odwierty w danym kraju
odwierty_w_kraju(X, Y) :-
    findall(Odwiert, odwiert(Odwiert, X), Y).


% Regu�a zwarca list� odwiert�w w zakresie podanych g��boko�ci
odwierty_w_zakresie_glebokosci(X, Y, Z) :-
    findall(Odwiert, (glebokosc(Odwiert, G), G >= X, G =< Y), Z).



% Przyk�ady:
%
% ?- odwiert(odw1, united_states).
% true.
% ?- odwiert(odw5, china).
% true.
% ?- odwiert(odw10,mexico).
% true.
%
% ?- glebokosc(odw1,2200).
% true.
% ?- glebokosc(odw3,3000).
% true.
% ?- glebokosc(odw11,216).
% true.
%
% ?- produkcja(odw1,6500).
% true.
% ?- produkcja(odw9,1400).
% true.
% ?- produkcja(odw10,100000).
% true.
%
% ?- gleboki(odw3).
% false.
% ?- gleboki(odw5).
% false.
% ?- gleboki(odw4).
% true.
%
% ?- wydajny(odw2).
% false.
% ?- wydajny(odw7).
% true.
% ?- wydajny(odw9).
% false.
%
% ?- info(odw1, Glebokosc, Produkcja).
% Glebokosc = 2200,
% Produkcja = 6500.
% ?- info(odw4, Glebokosc, Produkcja).
% Glebokosc = 3400,
% Produkcja = 5700.
% ?- info(odw8, Glebokosc, Produkcja).
% Glebokosc = 2438,
% Produkcja = 100000.
%
% ?- ile_metrow_w_barylkach(14,Y).
% Y = 2.226.
% ?- ile_metrow_w_barylkach(200,Y).
% Y = 31.8.
% ?- ile_metrow_w_barylkach(3450,Y).
% Y = 548.55.
%
% ?- ile_barylek_w_metrach(40,Y).
% Y = 252.0.
% ?- ile_barylek_w_metrach(100,Y).
% Y = 630.0.
% ?- ile_barylek_w_metrach(55,Y).
% Y = 346.5.
%
% ?- ile_litrow_w_barylkach(60,Y).
% Y = 9540.
% ?- ile_litrow_w_barylkach(4,Y).
% Y = 636.
% ?- ile_litrow_w_barylkach(11,Y).
% Y = 1749.
%
% ?- ile_ton(15,Y).
% Y = 2.0270270270270268.
% ?- ile_ton(145,Y).
% Y = 19.594594594594593.
% ?- ile_ton(3120,Y).
% Y = 421.6216216216216.
%
% ?- sumaryczna_produkcja(united_states,Y).
% Y = 19100.
% ?- sumaryczna_produkcja(mexico,Y).
% Y = 260000.
% ?- sumaryczna_produkcja(north_sea,Y).
% Y = 600000.
%
% ?- srednia_glebokosc(united_states,Y).
% Y = 2850.
% ?- srednia_glebokosc(mexico,Y).
% Y = 1305.3333333333333.
% ?- srednia_glebokosc(china,Y).
% Y = 2500.
%
% ?- globalna_produkcja(Y).
% Y = 975300.
%
% ?- najwieksza_produkcja(united_states,Y).
% Y = odw1 ;
% false.
% ?- najwieksza_produkcja(mexico,Y).
% Y = odw8 ;
% Y = odw10 ;
% false.
% ?- najwieksza_produkcja(russia,Y).
% Y = odw6 ;
% false.
%
% ?- na_ladzie(odw1).
% true.
% ?- na_ladzie(odw8).
% true.
% ?- na_ladzie(odw11).
% false.
%
% ?- odwierty_w_kraju(united_states,Y).
% Y = [odw1, odw2, odw3, odw4].
% ?- odwierty_w_kraju(china,Y).
% Y = [odw5].
% ?- odwierty_w_kraju(north_atlantic_ocean,Y).
% Y = [odw9].
%
% ?- odwierty_w_kraju(united_states,Y).
% Y = [odw1, odw2, odw3, odw4].
% ?- odwierty_w_kraju(china,Y).
% Y = [odw5].
% ?- odwierty_w_kraju(north_atlantic_ocean,Y).
% Y = [odw9].
%
