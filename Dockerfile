FROM alpine

ENV _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=gasp'

RUN echo "Building the Docker image..."

RUN apk update && apk upgrade && apk add \
     openjdk8-jre \
     ttf-dejavu \
     fontconfig  

COPY ./freemind-bin-max-1.0.1.zip fm.zip
RUN mkdir -p /softwares/freemind 
RUN unzip fm.zip -d ./softwares/freemind  && rm fm.zip
WORKDIR /softwares/freemind
RUN echo `ls`
RUN echo `pwd`
RUN chmod +x freemind.sh
CMD ["./freemind.sh"]
