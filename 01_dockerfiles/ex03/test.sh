docker build -t test01ex03 .
docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
