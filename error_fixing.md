## Bash

1. Wandb: 
> `ImportError: /usr/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.29` not found(required by ~/anaconda3/envs/my_env_name/lib)`

  solved by: 
> `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/anaconda3/envs/my_env_name/lib`
