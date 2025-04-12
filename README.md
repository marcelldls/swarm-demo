# swarm-demo

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
