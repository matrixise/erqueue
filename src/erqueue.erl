-module(erqueue).
-author("Stephane Wirtel <stephane@wirtel.be>").

-export([
    new/0, new/1,
    put/2, get/1,
    len/1,
    is_empty/1, is_full/1,
    dump/1,
    close/1
]).

-record(erqueue, {
    table,
    length = nil :: integer()
}).

-type erqueue() :: #erqueue{}.

-spec new() -> {ok, erqueue()} | {error, term()}.
new() ->
    new(nil).

-spec new(Length :: integer()) -> {ok, erqueue()} | {error, term()}.
new(Length) ->
    TableID = ets:new(queue, [public, ordered_set]),
    #erqueue{table=TableID, length=Length}.

-spec put(Ref :: erqueue(), Data :: any()) -> true.
put(#erqueue{table=TableID}=_Ref, Data) ->
    Key = case ets:last(TableID) of 
        '$end_of_table' -> 0;
        Counter -> Counter + 1
    end,

    true = ets:insert(TableID, {Key, Data}),
    ok.

-spec get(Ref :: erqueue()) -> {Data :: term()}.
get(#erqueue{table=TableID}=_Ref) ->
    case ets:first(TableID) of
        '$end_of_table' -> empty;
        First ->
            [{_, Item}] = ets:lookup(TableID, First),
            true = ets:delete(TableID, First),
            {value, Item}
    end.

-spec len(Ref :: erqueue()) -> integer().
len(#erqueue{table=TableID}=_Ref) ->
    ets:info(TableID, size).

-spec is_empty(Ref :: erqueue()) -> boolean().
is_empty(Ref) ->
    len(Ref) =:= 0.

-spec is_full(Ref :: erqueue()) -> boolean().
is_full(#erqueue{length=nil}=_Ref) ->
    no_maximum;

is_full(#erqueue{length=MaxLength}=Ref) ->
    len(Ref) =:= MaxLength.

-spec dump(Ref :: erqueue()) -> term().
dump(#erqueue{table=TableID}=_Ref) -> 
    ets:tab2list(TableID).

-spec close(Ref :: erqueue()) -> ok.
close(#erqueue{table=TableID}=_Ref) ->
    true = ets:delete(TableID),
    ok.


