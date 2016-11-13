#!/bin/bash -x

# ref: https://github.com/DrSnowbird/docker-zeppelin

ZEPPELIN_PORT=8080
# To start Zeppelin pull the latest image and run the container:
docker pull dylanmei/zeppelin
docker run --rm --name zeppelin -p $ZEPPELIN_PORT:8080 dylanmei/zeppelin

#echo "Zeppelin will be running at http://${YOUR_DOCKER_HOST}:8080"
MY_IP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

#echo "Zeppelin will be running at http://0.0.0.0:8080"
echo "Zeppelin will be running at http://$MY_IP:$ZEPPELIN_PORT"

