FROM java:openjdk-8-jre

ENV VERSION 4.1.3
ADD https://github.com/serge-rider/dbeaver/releases/download/${VERSION}/dbeaver-ce_${VERSION}_amd64.deb .
RUN apt-get update && apt-get install -y libswt-gtk-3-jni libswt-gtk-3-java 
RUN dpkg -i dbeaver-ce_${VERSION}_amd64.deb

RUN echo "Starting dbeaver!!!!!" >> temp.log
CMD dbeaver & tail -f temp.log
