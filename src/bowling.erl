%% Author: Franco Lombardo
%% Created: 09/mag/2010
%% Description: Robert C. Martin's Bowling Game Kata
-module(bowling).

-export([score/1]).

-include("bowling.hrl").

%%
%% API Functions
%%
score(Rolls) ->
  score(Rolls, 0).

score([A, B, C], ScoreSoFar) when ?is_spare(A, B) ->
  ScoreSoFar + A + B + C;
score([?STRIKE, A, B], ScoreSoFar) ->
  ScoreSoFar + ?STRIKE + A + B;
score([?STRIKE, A, B| NextRolls], ScoreSoFar) ->
  score([A, B] ++ NextRolls, ScoreSoFar + ?STRIKE + A + B);
score([A, B, C| NextRolls], ScoreSoFar) when ?is_spare(A, B) ->
  score([C| NextRolls], ScoreSoFar + A + B + C);
score([A, B| NextRolls], ScoreSoFar) ->
  score(NextRolls, ScoreSoFar + A + B);
score([], ScoreSoFar) ->
  ScoreSoFar.