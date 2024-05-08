% PRZETWARZANIE LIST
%
% wypisz_lista(+L)
% spe�niony, gdy ka�dy element listy L zostanie
% wypisany w nowym wierszu
% ---------------------------------------------------
%
% warunek ko�cz�cy rekurencj�: list� pust� uznajemy
% za wypisan�

wypisz_lista([]).

% rekurencja: wypisuje g�ow� listy i powtarzamy
% procedur� wypisywania dla ogona listy;
% predykat write/1 wypisujemy term H
% predykat nl/0 wyprowadza now� lini�

wypisz_lista([H|T]):-
    write(H),
    nl,
    wypisz_lista(T).
