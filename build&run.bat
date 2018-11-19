@echo off
docker stop kag-server
docker rm kag-server
docker build -t klemek/kag-server .
docker run -it -p 50301:50301/udp --name kag-server klemek/kag-server
pause