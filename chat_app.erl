start(_StartType, _StartArgs) ->

    ok = application:ensure_started(ebus),
 
   Dispatch = cowboy_router:compile(
                 [{'_', [
                         {"/", cowboy_static, {priv_file, chatbus, "index.html"}},
                         {"/ws", ws_handler, []},
                         {"/[...]", cowboy_static, {priv_dir, chatbus, "./"}}]}]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 9090}], [{env, [{dispatch, Dispatch}]}]),
    'chatbus_sup':start_link().
