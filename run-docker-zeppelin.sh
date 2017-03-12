#!/bin/bash -x

##################################################
#### ---- Mandatory: Change those ----
##################################################

PACKAGE_BASE=dylanmei
PACKAGE=zeppelin
docker_volume_data=/notebook
docker_port1=8080
local_docker_port1=18080

version=

##################################################
#### ---- Mostly, you don't need change below ----
##################################################

echo "Usage: "
echo "  ${0} [<repo-name/repo-tag>] [<repo-version>]"
echo "e.g."
echo "  ${0} ${PACKAGE_BASE}/${PACKAGE} 1.0.0"
echo "or"
echo "  ${0} ${PACKAGE_BASE}/${PACKAGE}"

# Reference: https://docs.docker.com/engine/userguide/containers/dockerimages/
imageTag=${1:-${PACKAGE_BASE}/${PACKAGE}}
version=${2:-${version}}
if [ "$version" == "" ]; then
    imageTagString=$imageTag
else
    imageTagString=${imageTag}:${version}
fi

#instanceName=my-${2:-${imageTag%/*}}_$RANDOM
instanceName=my-${2:-${imageTag##*/}}

#### ---- instance local data on the host ----
local_docker_data=~/docker-data/${PACKAGE}/notebook
mkdir -p ${local_docker_data}
cp -r notebook/* ${local_docker_data}/

MY_IP=`ip route get 1|awk '{print $NF;exit;}'`

#docker-compose up -d
docker-compose up 

#### ----- RUN -------
#echo "To run: for example"
#echo "docker run -d --name my-${imageTag##*/} -v ${docker_data}:/${docker_volume_data} ${imageTag}"
#echo "---------------------------------------------"
#echo "---- Starting a Container for ${imageTag}"
#echo "---------------------------------------------"
##docker run --rm -P -d --name $instanceName $imageTag
#docker run \
#    --detach \
#    --name=${instanceName} \
#    --publish ${local_docker_port1}:${docker_port1} \
#    --volume=${local_docker_data}:${docker_volume_data} \
#    ${imageTagString} 

#if [ ! "$version" == "" ]; then
#    echo "docker run --rm -P -d --name ${instanceName} -v ${local_docker_data}:${docker_volume_data} ${imageTag}:${version}"
#else
#    echo "docker run --rm -P -d --name ${instanceName} -v ${local_docker_data}:${docker_volume_data} ${imageTag}"
#fi
#
#echo "Web UI: http://${MY_IP}:${local_docker_port1}/"
#
#echo ">>> Docker Status"
#docker ps -a | grep "${instanceName}"
#echo "-----------------------------------------------"
#echo ">>> Docker Shell into Container `docker ps -lqa`"
##docker exec -it ${instanceName} /bin/bash

