FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y telnet

ENTRYPOINT ["telnet", "towel.blinkenlights.nl"]
