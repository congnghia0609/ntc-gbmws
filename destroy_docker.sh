#!/bin/bash

docker rm -vf $(docker ps -q --filter label=ntc-gbmws)
