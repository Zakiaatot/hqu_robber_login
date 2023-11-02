FROM ubuntu:jammy
RUN apt-get update && apt-get upgrade -y 
WORKDIR /server
COPY ./bin/hqu_robber_login .
RUN mv /server/hqu_robber_login /hqu_robber_login
CMD ["/hqu_robber_login"]
