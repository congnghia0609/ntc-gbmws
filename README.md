# ntc-gbmws
ntc-gbmws is a tool to benchmark resource WebSocket server by golang

## Environment
Linux (Ubuntu, CentOS,...), Golang, Docker  

## Usage
```bash
make deps

# start server
go run server.go epoll.go

# start client
go run client.go -conn=10000

or

./run_docker_clients.sh 10000 5 172.17.0.1
docker ps
./destroy_docker.sh
```

## Install library dependencies
```bash
make deps
```

## Build
```bash
make build
```

## Clean build
```bash
make clean
```

## Start Server
```bash
go run server.go epoll.go

or

./server
```

## Start Client
```bash
go run client.go -conn=10000

or

./client -conn=10000

or

# Start 5 docker, each docker run 10000 websocket connections
./run_docker_clients.sh 10000 5 172.17.0.1

# Check docker
docker ps

# Remove list docker
./destroy_docker.sh
```

## Tool profile golang
```bash
# Install library dependencies
sudo apt-get install graphviz

# Visualize goroutine
./pprof_goroutine.sh
(pprof) web
(pprof) exit

# Visualize heap
./pprof_heap.sh
(pprof) web
(pprof) exit
```

## Setup limit number of open file descriptors
```bash
### No restart server
sudo sysctl -w fs.file-max=12000500
cat /proc/sys/fs/file-max
sudo sysctl -w fs.nr_open=20000500
sudo sysctl -p
ulimit -n 1048576
#### Check
ulimit -a
ulimit -aH
ulimit -aS


or


### Need restart server
sudo vim /etc/sysctl.conf
----------------------------------------------i
fs.file-max=12000500
fs.nr_open=20000500
----------------------------------------------ESC | :wq

sudo vim /etc/security/limits.conf
----------------------------------------------i
* soft  nofile  1048576
* hard  nofile  1048576
----------------------------------------------ESC | :wq

sudo vim /etc/pam.d/common-session
----------------------------------------------i
session required pam_limits.so
----------------------------------------------ESC | :wq
```

## Increase conntrack table
```bash
sudo ./increase_conntrack_table.sh
```

## Others
```bash
# Visualize resource server by tool top
top -p $(pidof server)

# Count number connection websocket of server
ls -l /proc/$(pidof server)/fd | wc -l

# Check ulimit of server
cat /proc/$(pidof server)/limits

# Check log kern linux
tail -f /var/log/kern.log
```
