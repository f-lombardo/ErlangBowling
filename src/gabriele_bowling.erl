-module(gabriele_bowling).

-export([score/1]).

score(Rolls) -> score(Rolls, 10).

score(_Rolls, 0) -> 0;
score(Rolls, NumberOfFrame) ->
  case Rolls of
    [ 10, FirstOfNextFrame, SecondOfNextFrame | NextRolls ] ->
      10 + FirstOfNextFrame + SecondOfNextFrame + 
        score([ FirstOfNextFrame, SecondOfNextFrame | NextRolls ], NumberOfFrame - 1);

    [ FirstOfCurrentFrame, SecondOfCurrentFrame, FirstOfNextFrame | NextRolls ] 
        when FirstOfCurrentFrame + SecondOfCurrentFrame =:= 10 -> 
      FirstOfCurrentFrame + SecondOfCurrentFrame + FirstOfNextFrame + 
        score([ FirstOfNextFrame | NextRolls ], NumberOfFrame - 1);

    [ FirstOfCurrentFrame, SecondOfCurrentFrame | NextRolls ] ->
      FirstOfCurrentFrame + SecondOfCurrentFrame +
        score(NextRolls, NumberOfFrame - 1)
  end.