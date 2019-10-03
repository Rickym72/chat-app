F = fun({Channel, Msg}, Ctx) ->
      io:format("[Pid: ~p][Channel: ~p][Msg: ~p][Ctx: ~p]~n",
                [self(), Channel, Msg, Ctx])
    end.

MH2 = ebus_handler:new(F, {my_ctx, <<"MH2">>}).
% made if not exist 
ebus:sub(ch1, [MH2]).

% push a msg 
ebus:pub(ch1, "Hello!").
[Pid: <0.52.0>][Channel: ch1][Msg: "Hello!"][Ctx: {my_ctx,<<"MH2">>}]
