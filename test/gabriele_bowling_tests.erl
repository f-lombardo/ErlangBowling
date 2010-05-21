-module(gabriele_bowling_tests).

-include_lib("eunit/include/eunit.hrl").

roll_many(Times, Pins) ->
  [ Pins || _ <- lists:seq(1, Times) ].

should_score_0_for_all_zeros_test() ->
  ?assertEqual(0, bowling:score(roll_many(20, 0))).

should_score_20_for_all_ones_test() ->
  ?assertEqual(20, bowling:score(roll_many(20, 1))).

a_thrown_should_count_twice_after_a_spare_test() ->
  ?assertEqual(16, bowling:score([ 5, 5, 3 | roll_many(17, 0) ])).

a_frame_should_count_twice_after_a_strike_test() ->
  ?assertEqual(24, bowling:score([ 10, 3, 4 | roll_many(16, 0) ])).
 
should_score_10_when_a_string_is_followed_by_zeros_test() ->
  ?assertEqual(10, bowling:score([ 10 | roll_many(18, 0) ])).

a_frame_is_a_spare_when_a_zero_is_followed_by_a_10_test() ->
  ?assertEqual(20, bowling:score([ 0, 10, 5 | roll_many(17, 0) ])).

should_score_300_for_a_perfect_game_test() ->
  ?assertEqual(300, bowling:score(roll_many(12, 10))).

last_frame_with_a_spare_should_have_a_bonus_throw_test() ->
  ?assertEqual(13, bowling:score(roll_many(18, 0) ++ [ 5, 5, 3 ])).

last_frame_with_a_strike_should_have_two_bonus_throws_test() ->
  ?assertEqual(16, bowling:score(roll_many(18, 0) ++ [ 10, 3, 3 ])).