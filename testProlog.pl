%factorial(N)={ 1 , n=0
%             {factorial(N-1), otherwise
%factorial(N:integer,R:integer)
%(i,o)

factorial(0,1).
factorial(N,R):-N1 is  N-1, factorial(N1,R1), R is R1*N.

%                       { [], n=0
%substitute(l1..ln,Pos)={ substitute(l2..ln,Pos+1), Pos mod 2=0
%                       { factorial(Pos) U substitute(l2..ln,Pos+1), Pos
%                       mod 2!=0

%substitute(L:list,Pos:int,R:list)
%(i,i,o)

substitute([],_,[]).
substitute([H|T],Pos,[H|R]):-NextPos is Pos+1,NextPos mod 2 =:=0, substitute(T,NextPos,R).
substitute([_|T],Pos,[R1|R]):-NextPos is Pos+1,NextPos mod 2 =\=0, factorial(Pos,R1), substitute(T,NextPos,R).

mainSubstitute(L,R):-substitute(L,1,R).
