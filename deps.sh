#!/bin/bash
# Author:       nghiatc
# Email:        congnghia0609@gmail.com

# source /etc/profile

echo "Install library dependencies..."
go get -u github.com/gorilla/websocket
go get -u github.com/tools/godep
go get -u github.com/gorilla/mux
go get -u github.com/gobwas/ws

echo "Install dependencies complete..."
