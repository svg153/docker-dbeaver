FROM adoptopenjdk/openjdk8:x86_64-debian-jdk8u252-b09-slim

RUN apt-get update && \
    apt-get install -y \
        x11-apps \
        libswt-gtk-3-jni libswt-gtk-3-java \
        && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

ARG VERSION=5.2.0
ENV VERSION ${VERSION}
ENV NAME dbeaver-ce_${VERSION}_amd64.deb
ADD https://github.com/dbeaver/dbeaver/releases/download/${VERSION}/${NAME} .
RUN dpkg -i ${NAME} && \
    rm ${NAME}

CMD ["/usr/bin/xeyes"]
CMD ["dbeaver"]
