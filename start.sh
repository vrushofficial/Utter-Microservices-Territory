#!/usr/bin/env bash

BUILD=$1;

function print_green() {
    echo -e "\e[32m$1\e[0m"
}

function print_error() {
    echo -e "\e[31m[x] $1\e[0m"
}

function print_blue() {
    echo -e "\e[34m$1\e[0m"
}

print_green "███████╗███████╗████████╗██╗   ██╗██████╗ "
print_green "██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗"
print_green "███████╗█████╗     ██║   ██║   ██║██████╔╝"
print_green "╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ "
print_green "███████║███████╗   ██║   ╚██████╔╝██║     "
print_green "╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     "
echo


if [[ "$BUILD" = '--build' ]] ; then
    print_blue "Starting docker build"
    echo;
    ./build.sh
fi


docker-compose -f docker-compose-infra.yml up -d;

docker-compose -f docker-compose-rabbitmq.yml up -d;

#./wait.sh 10 http://localhost:15692/metrics "docker-compose-rabbitmq.yml" "rabbitmq-zipkin"
#./wait.sh 10 http://localhost:15693/metrics "docker-compose-rabbitmq.yml" "rabbitmq-business"

#./wait.sh 5 http://localhost:8000

#
docker-compose -f docker-compose-zipkin-eureka.yml up -d;

#./wait.sh 5 http://localhost:8761/actuator/health


docker-compose -f docker-compose-backend-services.yml up -d;


#./wait.sh 5 http://localhost:8100/actuator/health
#./wait.sh 5 http://localhost:8101/actuator/health
#./wait.sh 5 http://localhost:8102/actuator/health
#
#print_blue "Starting Searching Services";
#echo;
#
#./wait.sh 5 http://localhost:8200/actuator/health
#./wait.sh 5 http://localhost:8201/actuator/health
#
#print_blue "Starting Financial Service";
#echo;
#
#./wait.sh 5 http://localhost:8300/actuator/health
#
#print_green "All Backend services are running";
#echo;

docker-compose -f docker-compose-frontend-service.yml up -d;

#print_blue "Starting Frontend Service";
#echo;
#
#./wait.sh 5 http://localhost:8400/actuator/health
#
#print_green "Frontend Service is running";
#echo;

docker-compose -f docker-compose-ELK-stack.yml up -d;
