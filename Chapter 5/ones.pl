% Create a solution for Exercise 5.5, page 88
% In ra 1024 số 1
print_ones(0).
print_ones(N) :-
    N > 0,
    write(1), nl,
    N1 is N - 1,
    print_ones(N1).

% Gọi: ?- print_ones(1024).
