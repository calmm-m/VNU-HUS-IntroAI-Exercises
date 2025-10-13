% Create a solution for Exercise 5.1, page 88. More precisely, you will attempt to prove the equality of left- and right-neutral elements of semigroups with PROLOG and fail. Try to explain why?
% Định nghĩa phép toán kết hợp trong semigroup: op(X, Y, Z) nghĩa là X * Y = Z
% Ta mô phỏng một semigroup nhỏ với các phần tử a, b, e, f

% Phép toán cụ thể
op(e, a, a).  % e là trung hoà trái
op(e, b, b).
op(a, f, a).  % f là trung hoà phải
op(b, f, b).

% Các phép toán khác trong semigroup
op(a, a, aa).
op(a, b, ab).
op(b, a, ba).
op(b, b, bb).

% Kiểm tra trung hoà trái: e * x = x với mọi x
left_neutral(E) :-
    forall(member(X, [a, b]), op(E, X, X)).

% Kiểm tra trung hoà phải: x * f = x với mọi x
right_neutral(F) :-
    forall(member(X, [a, b]), op(X, F, X)).

% Kiểm tra xem e và f có bằng nhau không
equal_neutral(E, F) :-
    left_neutral(E),
    right_neutral(F),
    E = F.

% Chạy kiểm tra
run :-
    equal_neutral(E, F),
    format('Trung hoà trái và phải đều là: ~w~n', [E]).
[semigroup].
run.
