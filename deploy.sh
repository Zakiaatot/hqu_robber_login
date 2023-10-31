#!/bin/bash
docker build -t hqu_robber_login .
docker run -id --name hqu_robber_login -p 8085:8085 hqu_robber_login
# docker logs hqu_robber_login
