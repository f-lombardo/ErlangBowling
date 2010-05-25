-module(bowling_tests).

-export([listOf/2]).

-include_lib("eunit/include/eunit.hrl").

-include("bowling.hrl").

%%
%% Tests
%%
gameWithNoPinsDownScoressZero_test() ->
	NoPinsDownGame = listOf(0, 20),
	?assertEqual(0, bowling:score(NoPinsDownGame)).

gameWithAllOnesScoressTwenty_test() ->
	GameOfAllOnes = listOf(1, 20),
	?assertEqual(20, bowling:score(GameOfAllOnes)).

gameOneSpareHasSpareBouns_test() ->
	Game = [5, 5, 3] ++  listOf(0, 17),
	?assertEqual(16, bowling:score(Game)).

gameOneInitialStrikeHasStrikeBouns_test() ->
	Game = [?STRIKE, 3, 4] ++ listOf(0, 16),
	?assertEqual(24, bowling:score(Game)).

perfectGameScores300_test() ->
	Game = listOf(?STRIKE, 12),
	?assertEqual(300, bowling:score(Game)).
	
spareOnLastFrameHasSpareBonus_test() ->
	Game = listOf(1, 18) ++ [3, 7, 3],
	?assertEqual(31, bowling:score(Game)).

strinkeOnLastFrameHasStrikeBonus_test() ->
  Game = listOf(0, 18) ++ [10, 2, 3],
  ?assertEqual(15, bowling:score(Game)).

pitStrikeNinthFrame_test() ->
  Game = listOf(0, 16) ++ [10, 2, 3],
  ?assertEqual(20, bowling:score(Game)).

%%
%% Service functions
%%
listOf(Element, Times) ->
  lists:duplicate(Times, Element).
