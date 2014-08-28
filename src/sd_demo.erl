-module(sd_demo).
-export([run/0]).

run() ->
    io:get_chars("Ready to start demo, press any key to continue ...\n", 1),
    Nodes=config:get_key(nodes),
    {Group1, Group2} = lists:split(6,Nodes),
    MasterGroup = [node(),lists:nth(1,Group1),lists:nth(1,Group2)],
    grouping:make_group(Group1,1),
    grouping:make_group(Group2,2),
    s_group:new_s_group(master_group, MasterGroup),
    MasterList = [MasterGroup, Group1, Group2],
    SubMasters = [{'node1@127.0.0.1',group1,5000},{'node7@127.0.0.1',group2,5000}],
    perpetual_demo(MasterList, SubMasters).


perpetual_demo([MasterGroup,Group1,Group2], SubMasters) ->
    N= 10000, %% 100000%% calculates Orbit for 0..N
    P= 40,
    io:format("Running full orbit calculation~n"),
    bench:sz(master:orbit(bench:g12345(N),[0],P,1,false,SubMasters)),
    io:format("Deleting group 1~n"),
    s_group:delete_s_group(group1),
    io:format("Running orbit only on group 2~n"),
    bench:sz(master:orbit(bench:g12345(N),[0],P,1,false,[lists:nth(2,SubMasters)])),
    io:format("Deleting group 2~n"),
    s_group:delete_s_group(group2),
    io:format("Running orbit on remaining nodes~n"),
    bench:sz(master:orbit(bench:g12345(N),[0],P,1,false,[{'sd_orbit@127.0.0.1',master_group,5000}])),
    io:format("Adding groups 1 and 2 again~n"),
    s_group:new_s_group(group1, Group1),
    timer:sleep(500),
    s_group:new_s_group(group2, Group2),
    perpetual_demo([MasterGroup,Group1,Group2], SubMasters).
    
