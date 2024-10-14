# Tested with 3.19, if alpine stops supporting jdk8, use 3.19 version.
# docker pull alpine:3.19.0 
FROM alpine

ENV _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=gasp'

RUN echo "Building the Docker image..."

RUN apk update && apk upgrade && apk add \
     openjdk8-jre \
     ttf-dejavu \
     fontconfig  

RUN mkdir -p /softwares/freemind 
WORKDIR /softwares/freemind
COPY ./freemind-bin-max-1.0.1.zip fm.zip
RUN unzip fm.zip  && rm fm.zip
RUN echo `ls`
RUN echo `pwd`
RUN chmod +x freemind.sh
CMD ["./freemind.sh"]
