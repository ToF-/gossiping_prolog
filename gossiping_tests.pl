% to run the tests:
% swipl -g run_tests -t halt gossiping_tests.pl

:- begin_tests(gossiping_time).
:- use_module('gossiping').
test('alice at minute 0') :- stopOn(alice, 0, 3).
test('alice at minute 2') :- stopOn(alice, 2, 2).
test('alice at minute 4') :- stopOn(alice, 4, 3).
test('alice at minute 5') :- stopOn(alice, 5, 1).
test('clara at minute 20') :- stopOn(clara, 20, 4).

test('drivers meetings at time 2 at station 3') :- meetingsAt(2, 3, [bert,clara]).
test('drivers meetings at time 12 at station 3') :- meetingsAt(12, 3, [alice, bert, clara]).
test('drivers meetings at time 0 at station 4 (only clara)') :- meetingsAt(0, 4, []).
test('drivers meetings at time 4 at station 5 (only clara)') :- meetingsAt(4, 5, []).
:- end_tests(gossiping_time).


