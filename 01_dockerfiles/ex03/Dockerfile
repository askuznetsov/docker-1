# Docker can be useful to test an application that’s still being developed without polluting
# your libraries. You will have to design a Dockerfile that gets the development
# version of Gitlab - Community Edition installs it with all the dependencies and the necessary
# configurations, and launches the application, all as it builds. The container will be
# deemed valid if you can access the web client, create users and interact via GIT with this
# container (HTTPS and SSH). Obviously, you are not allowed to use the official container
# from Gitlab, it would be a shame...

FROM debian

RUN apt-get update -y && apt-get upgrade -y

# DEPENDENCIES

RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install gcc -y

# INSTALL GO

WORKDIR $HOME/local
RUN wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
RUN tar -xzvf go1.8.linux-amd64.tar.gz

ENV GOROOT=$HOME/local/go
ENV GOPATH=$HOME/gogs
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

WORKDIR $GOPATH/src/github.com/gogits

# DOWNLOAD GOGS FROM DEVELOP BRANCH

RUN git clone --depth=1 -b develop https://github.com/gogits/gogs
RUN go get -u -tags "sqlite" github.com/gogits/gogs
WORKDIR $GOPATH/src/github.com/gogits/gogs
RUN go build -tags "sqlite"

# CREATE DIRECTORIES

RUN mkdir $GOPATH/src/github.com/gogits/logs
RUN mkdir /root/gogs-repositories
RUN mkdir /root/data

# START

EXPOSE 3000

# USER_ROOT

ENV USER=root

ENTRYPOINT ./gogs web
