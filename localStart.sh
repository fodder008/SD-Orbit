#!/bin/bash 

erl -name node2@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node3@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node4@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node5@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node6@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node7@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node8@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node9@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node10@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node11@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node12@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name node1@127.0.0.1 -detached -pa ebin/ -config s_group.config
erl -name sd_orbit@127.0.0.1 -pa ebin/ -config s_group.config
