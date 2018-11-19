FROM debian:latest

RUN apt-get update -y \
	&& apt-get install -y curl lib32stdc++

WORKDIR /var/kag
RUN curl -LO http://dl.kag2d.com/kag-linux32-dedicated-release.tar.gz \
	&& tar xvzf kag-linux32*.tar.gz \
	&& rm kag-linux32*.tar.gz

COPY autoconfig.cfg /var/kag/autoconfig.cfg

EXPOSE 50301:50301/udp

CMD echo "Starting KAG dedicated server on port 50301" \
	&& chmod +x KAGdedi \
	&& sleep 2 \
	&& ./KAGdedi autostart Scripts/server_autostart.as autoconfig autoconfig.cfg