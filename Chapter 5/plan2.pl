% Create a solution for Exercises 5.2 and 5.3, page 88 using plan.pl
write_move(state(F1,W1,G1,C1), state(F2,W2,G2,C2)) :-
    across(F1,F2),
    write('The farmer crosses from '), write(F1), write(' to '), write(F2),
    ( W1 = F1, W2 = F2 -> write(' with the wolf')
    ; G1 = F1, G2 = F2 -> write(' with the goat')
    ; C1 = F1, C2 = F2 -> write(' with the cabbage')
    ; write(' alone')
    ),
    nl.
write_path([_]).
write_path([State1, State2 | Rest]) :-
    write_move(State1, State2),
    write_path([State2 | Rest]).
action(Start,Goal) :-
   plan(Start,Goal,[Start],Path),
   nl,write('Solution:'),nl,
   write_path(Path), fail.
plan(Start, Goal, Visited, Path) :-
    go(Start, Next),
    safe(Next),
    \+ member(Next, Visited),
    plan(Next, Goal, [Next|Visited], Path).
action(Start,Goal) :-
   once(plan(Start,Goal,[Start],Path)),
   nl,write('Solution:'),nl,
   write_path(Path).
