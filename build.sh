#!/bin/bash

docker run -d --name registry registry:2.0.1
docker cp registry:/go/bin/registry .
docker cp registry:/go/src/github.com/docker/distribution/cmd/registry/config.yml .
docker stop registry
docker rm registry
sed 's/localhost/127.0.0.1/' config.yml > config2.yml
rm config.yml
mv config2.yml config.yml

mkdir lib64
cp /lib64/ld-linux-x86-64.so.2 ./lib64/
cp /lib64/libc.so.6 ./lib64/
cp /lib64/libpthread.so.0 ./lib64/
mkdir bin
cp /bin/bash ./bin/
mkdir -p tmp/registry-dev

docker build -t registry:scratch .

rm -f -r bin lib64 tmp config.yml registry
