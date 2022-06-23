:- module(gossiping, [gossiping_time/1, stopOn/3, meetingsAt/3]).

% there are 4 stops on the driver 0 route
stops(alice, 4).
stops(bert, 4).
stops(clara, 5). 
% driver 0: at minute 0, stops at 3, at minute 1 stops at 1, etc.
stop(alice, 0, 3).
stop(alice, 1, 1).
stop(alice, 2, 2).
stop(alice, 3, 3).
stop(bert, 0, 3).
stop(bert, 1, 2).
stop(bert, 2, 3).
stop(bert, 3, 1).
stop(clara, 0, 4).
stop(clara, 1, 2).
stop(clara, 2, 3).
stop(clara, 3, 4).
stop(clara, 4, 5).

stopOn(Driver, Minute, Result) :-
    stops(Driver, Stops),
    Time is Minute mod Stops,
    stop(Driver, Time, Result).

meetingsAt(Minute, Station, Result) :- 
        findall(Driver, stopOn(Driver, Minute, Station), Group),
        length(Group, N),
        (N > 1 -> Result = Group ; Result = []).

gossiping_time(T) :- 
    T is 0.
