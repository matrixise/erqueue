-module(erqueue_tests).
-include_lib("eunit/include/eunit.hrl").

erqueue_empty_test() ->
    Queue = erqueue:new(),
    ?assertEqual(true, erqueue:is_empty(Queue)),
    ?assertEqual(0, erqueue:len(Queue)),
    ?assertEqual(ok, erqueue:close(Queue)).

erqueue_empty_not_full_test() ->
    Queue = erqueue:new(),
    ?assertEqual(no_maximum, erqueue:is_full(Queue)),
    ?assertEqual(ok, erqueue:close(Queue)).

erqueue_full_test() ->
    Queue = erqueue:new(2),
    ?assertEqual(true, erqueue:is_empty(Queue)),

    ?assertEqual(false, erqueue:is_full(Queue)),

    ?assertEqual(ok, erqueue:put(Queue, <<"hello">>)),
    ?assertEqual(ok, erqueue:put(Queue, <<"world">>)),

    ?assertEqual(2, erqueue:len(Queue)),

    ?assertEqual(true, erqueue:is_full(Queue)),
    ?assertEqual(false, erqueue:is_empty(Queue)),

    ?assertEqual(ok, erqueue:close(Queue)).

erqueue_test() ->
    Queue = erqueue:new(),

    erqueue:put(Queue, <<"hello">>),
    erqueue:put(Queue, <<"world">>),
    erqueue:put(Queue, <<"!">>),
    {value, Value} = erqueue:get(Queue),
    ?assertEqual(<<"hello">>, Value),

    {value, Value2} = erqueue:get(Queue),
    ?assertEqual(<<"world">>, Value2),

    {value, Value3} = erqueue:get(Queue),
    ?assertEqual(<<"!">>, Value3),

    ?assertEqual(ok, erqueue:close(Queue)).