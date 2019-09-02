shuffle([A0],[B0],[A0,B0]).
shuffle([S10|T10],[S20|T20],[S10|[S20|[S30|S40]]]) :-shuffle(T10,T20,[S30|S40]).

double([T1],[T1,T1]).
double([A|B],[A|[A|[C|D]]]) :-double(B,[C|D]).

append([],X,X).
append([H1|T1],X,[H1|T2]) :-append(T1,X,T2).

member(X,Y)  :-append(A,[X|B],Y).

no_duplicates([A0|[]],[A0|[]]).
no_duplicates([E1|F1],G1) :-member(E1,F1), no_duplicates(F1,G1).
no_duplicates([A1|B1],[A1|[D1|H1]]) :- \+ member(A1,B1), no_duplicates(B1,[D1|H1]).

all_members([],[],B).
all_members([S1|T1],[T2|T3],T5) :-member(S1,T5), all_members(T1,T3,T5), append(A,[T2|T3],T5).

same_elements(A4,Z4) :-all_members(Z4,A4,A4), all_members(A4,Z4,Z4).

