# swarm-demo

Note:
- Any `$` must be escaped as: `$$`
- Swarm
    - Doesnt support the `extends`, `depends_on`, `build`, `restart` key
    - Requires an explicit definition of the network in your stack.yaml
    - Doesnt provide a mechanism to `exec` or `attach` to a container in the stack (use `docker attach/exec`)
    - Doesnt provide a mechanism to check logs. Use `docker service logs <service>`
    - Doesnt provide a mechanism for dealing with stateful containers
    - Doesnt have a "namespace" equivelent
- Compose
    - Doesnt support the `deploy.placement` key

## Running in docker-compose (single host)

Usage:
```
marcelln@LegionM:~/wip/swarm-demo$ docker compose up
[+] Running 4/4
 ✔ Container swarm-demo-master-1  Creat...                                 0.0s
 ✔ Container swarm-demo-debug-1   Create...                                0.0s
 ✔ Container swarm-demo-worker-2  Recre...                                 0.1s
 ✔ Container swarm-demo-worker-1  Recre...                                 0.1s
Attaching to debug-1, master-1, worker-1, worker-2
master-1  | hello from 172.18.0.4 at 12:03:49
master-1  | hello from 172.18.0.5 at 12:03:49
master-1  | hello from 172.18.0.4 at 12:03:54
master-1  | hello from 172.18.0.5 at 12:03:54
```

Scaling:
```
docker compose scale worker=3
```

## Running in docker-swarm (multi host)

Usage:
```
docker swarm init --advertise-addr <IP_address>
docker stack deploy --compose-file stack.yaml demo
```

Adding a node as a worker:
```
docker swarm join --token SWMTKN-1-0ix9dqimvlqxkq5n5gm4w1m25thoqd8r5dpcq0cqie7np57oyh-8h2ev7n3r82x6my3izj9bp9xx 10.255.255.254:2377
```

clean up
```
docker swarm leave --force  # Allow manager to leave swarm
```
