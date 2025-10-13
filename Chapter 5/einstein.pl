% Create a solution for Exercise 5.9, page 89
.
% Giải bài toán Einstein's Riddle bằng Prolog

:- use_module(library(clpfd)).

solve :-
    Houses = [_, _, _, _, _],
    Houses = [
        house(N1, C1, D1, S1, P1),
        house(N2, C2, D2, S2, P2),
        house(N3, C3, D3, S3, P3),
        house(N4, C4, D4, S4, P4),
        house(N5, C5, D5, S5, P5)
    ],

    % Các giá trị có thể
    permutation([norwegian, dane, briton, german, swede], [N1,N2,N3,N4,N5]),
    permutation([yellow, blue, red, green, white], [C1,C2,C3,C4,C5]),
    permutation([water, tea, milk, coffee, beer], [D1,D2,D3,D4,D5]),
    permutation([dunhill, marlboro, pallmall, rothmanns, winfield], [S1,S2,S3,S4,S5]),
    permutation([cat, horse, bird, fish, dog], [P1,P2,P3,P4,P5]),

    % Các gợi ý
    member(house(briton, red, _, _, _), Houses),
    member(house(swede, _, _, _, dog), Houses),
    member(house(dane, _, tea, _, _), Houses),
    next_to(house(, green, _, _, _), house(, white, _, _, _), Houses),
    member(house(_, green, coffee, _, _), Houses),
    member(house(_, _, _, pallmall, bird), Houses),
    Houses = [_, , house(, _, milk, _, _), _, _],
    Houses = [house(norwegian, _, _, _, _) | _],
    next_to(house(, _, _, marlboro, _), house(, _, _, _, cat), Houses),
    next_to(house(, _, _, _, horse), house(, _, _, dunhill, _), Houses),
    member(house(_, _, beer, winfield, _), Houses),
    next_to(house(, _, _, rothmanns, _), house(, _, water, _, _), Houses),
    member(house(german, _, _, rothmanns, _), Houses),

    member(house(Owner, _, _, _, fish), Houses),
    format("Người nuôi cá là: ~w~n", [Owner]).

next_to(A, B, List) :- append(_, [A,B|_], List).
next_to(A, B, List) :- append(_, [B,A|_], List).
