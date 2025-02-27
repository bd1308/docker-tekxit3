FROM openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV URL=https://tekxit.b-cdn.net/downloads/tekxit3.14/1.0.980TekxitPiServer.zip
ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install unzip wget -y --no-install-recommends 

RUN wget ${URL} -O mc.zip
RUN unzip mc.zip -d /data-temp

COPY ./start.sh start.sh    
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]

