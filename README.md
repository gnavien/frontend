

# If you wanted to create a docker image of your frontend micro service we need to pull the frontend from the GIT repository. Once we have done the pull move to frontend directory. then we can issue a docker command  docker build .  --> this will build the nginx image with our frotnend contents from the folder.

# sudo usermod -a -G docker centos --> to make the docker user part of the centos

[ centos@workstation ~/frontend ]$ docker build .

[ centos@workstation ~/frontend ]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
<none>       <none>    a605aa71d4db   8 seconds ago   194MB

[ centos@workstation ~/frontend ]$ docker run -d a605aa71d4db
7964a94d134ce0f35fdc8f16dc80e59e0aa9142dd7222ee8010112d6acdb14f0

[ centos@workstation ~/frontend ]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS     NAMES
7964a94d134c   a605aa71d4db   "/docker-entrypoint.…"   4 seconds ago   Up 4 seconds   80/tcp    wizardly_pascal

[ centos@workstation ~/frontend ]$ docker exec -it 7964a94d134c bash
root@7964a94d134c:/# cd /usr/share/nginx/html/

[ centos@workstation ~/frontend ]$ docker run -d -P a605aa71d4db --> -P here the docker generates a random port to expose our services.

[ centos@workstation ~/frontend ]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                     NAMES
853c75ca011e   a605aa71d4db   "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:32768->80/tcp, :::32768->80/tcp   kind_stonebraker



[ centos@workstation ~/frontend ]$ docker run -d -p 80:80  a605aa71d4db --> -p we can mention the port which we need to expose

[ centos@workstation ~/frontend ]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                                     NAMES
62d6be562225   a605aa71d4db   "/docker-entrypoint.…"   6 seconds ago        Up 5 seconds        0.0.0.0:80->80/tcp, :::80->80/tcp         infallible_johnson


# If we need to give a DNS record inside the container for the container to access other services. So we will create a nginx-roboshop.conf file were we give all the inputs of DNS record of other services.

# We will give all the inputs of DNS records and then wrap the image in to a container

# The nginx container which we had received has a image of Debian. We have to do necessary changes to the default.conf file based on our host names.

root@853c75ca011e:/etc/nginx/conf.d# cat /etc/*release
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

# We will use the default.conf parameters to give inputs to our dns records 