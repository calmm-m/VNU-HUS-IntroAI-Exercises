% Create a solution for Exercise 5.8(c)
% Khởi tạo cơ sở dữ liệu động
:- dynamic fib_cache/2.

% fib(N, R): Tính số Fibonacci thứ N và lưu vào cache
fib(0, 1) :- asserta(fib_cache(0, 1)).
fib(1, 1) :- asserta(fib_cache(1, 1)).
fib(N, R) :-
    N > 1,
    ( fib_cache(N, R) -> true  % Nếu đã có trong cache thì dùng luôn
    ; N1 is N - 1,
      N2 is N - 2,
      fib(N1, R1),
      fib(N2, R2),
      R is R1 + R2,
      asserta(fib_cache(N, R))  % Lưu kết quả vào cache
    ).
