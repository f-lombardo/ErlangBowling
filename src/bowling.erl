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
  simpleScore(frames(Rolls, ?NUMBER_OF_FRAMES)).

simpleScore(Frames) ->
  SumOfElements = fun ({A, B}, Accumulator) -> A + B  + Accumulator;
                      ({A, B, C}, Accumulator) -> A + B + C + Accumulator
                  end,
  lists:foldl(SumOfElements, 0, Frames).

frames(_Rolls, 0) ->
  [];

frames([A, B, C | NextRolls], FramesLeft) when ?is_spare(A, B) andalso ?not_last_frame(FramesLeft) ->
  [{A, B, C} | frames([C | NextRolls], FramesLeft -1)];

frames([A, B, C | NextRolls], FramesLeft) when ?is_spare(A, B) ->
  [{A, B, C} | frames(NextRolls, FramesLeft -1)];

frames([?STRIKE, A, B | NextRolls], FramesLeft) when ?not_last_frame(FramesLeft)->
  [{?STRIKE, A, B} | frames([A | [B | NextRolls]], FramesLeft -1)];

frames([?STRIKE, A, B | NextRolls], FramesLeft) ->
  [{?STRIKE, A, B} | frames(NextRolls, FramesLeft -1)];

frames([A, B | NextRolls], FramesLeft) ->
  [{A, B} | frames(NextRolls, FramesLeft -1)].
