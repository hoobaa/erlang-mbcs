-module(crawl).

-compile(export_all).

temp(Url, From, To)->
    inets:start(),
    mbcs:start(),
    {ok, {_,_,B}} = httpc:request(Url),
    file:write_file("/tmp/out-bin", B),
    B_utf = mbcs:from_to( B, From, To, [{error,ignore},{return,binary}] ),
    file:write_file("/tmp/out-utf", B_utf),
    B_utf.    

test(1)->
    temp("http://www.caribbeancom.com/index2.htm", euc, utf8);

test(2)->
    %temp("http://www.oreimo-anime.com/", utf8, cp932).
    temp("http://www.oreimo-anime.com/", cp932, utf8).


snip()->
    inets:start(),
    mbcs:start(),
    %file:write_file("/tmp/fuck1", list_to_binary("あいう")),
    A=mbcs:from_to(list_to_binary("あいう"), utf8, cp932),
    file:write_file("/tmp/fuck", A),
    io:format("[~w]", [binary_to_list(A)]).
    %lists:map( fun(X)->io:format("[~.16#]", [X]) end,
    %           binary_to_list(A) ).

% hd(binary_to_list( mbcs:from_to( list_to_binary("あいう"), utf8, cp932 ) )).    
    

