FROM busybox
MAINTAINER Jonathon M. Abbott <jonathona@everydayhero.com>

ADD loggle-*.sh /opt/loggle/
ADD jq /opt/loggle/

RUN mkdir /loggle
VOLUME /loggle

CMD ["/opt/loggle/loggle-install.sh"]
