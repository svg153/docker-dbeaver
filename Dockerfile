FROM java:openjdk-8-jre

ADD dbeaver-ce_3.7.7_amd64.deb .

RUN apt-get update

RUN dpkg -i dbeaver-ce_3.7.7_amd64.deb

RUN echo "Starting dbeaver!!!!!" >> temp.log

CMD dbeaver & tail -f temp.log