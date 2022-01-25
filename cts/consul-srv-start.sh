#! /bin/bash
docker run -d -p 8500:8500 --name=consul-srv -e CONSUL_BIND_INTERFACE=eth0 consul