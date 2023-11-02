FROM debian:buster-slim
RUN apt-get update && apt-get upgrade
WORKDIR /server
COPY ./bin/hqu_robber_login .
RUN mv /server/hqu_robber_login /hqu_robber_login
CMD ["/hqu_robber_login"]