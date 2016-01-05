FROM hypriot/rpi-alpine-scratch

RUN echo "http://dl-3.alpinelinux.org/alpine/v3.3/community/" >> /etc/apk/repositories &&\
	apk update && \
	apk add openjdk7-jre-base openssl &&\
	mkdir /data /data/world &&\
	wget -O minecraft-server.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.7/minecraft_server.1.8.7.jar &&\
	chmod +x minecraft-server.jar &&\
	mv minecraft-server.jar /lib/

COPY server.properties /data/
COPY banned-ips.json /data/
COPY banned-players.json /data/
COPY eula.txt /data/
COPY ops.json /data/
COPY usercache.json /data/
COPY whitelist.json /data/

ENV MOTD A Minecraft Server Powered by Docker on Raspberry Pi
ENV TYPE=VANILLA VERSION=LATEST FORGEVERSION=RECOMMENDED LEVEL=world PVP=true DIFFICULTY=easy \
  LEVEL_TYPE=DEFAULT GENERATOR_SETTINGS=
	
EXPOSE 25565
	
WORKDIR /data

CMD /usr/bin/java -Xms256M -Xmx756M -jar /lib/minecraft-server.jar nogui
