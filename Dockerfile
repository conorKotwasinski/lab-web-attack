FROM gcc:latest
RUN apt-get update && apt-get install -y netcat-openbsd iptables net-tools iputils-ping
COPY ./listener /build
COPY firewall_test.bash /root
COPY firewall_iptable_check.bash /root
WORKDIR /build
RUN make install
WORKDIR /root
RUN rm -rf /build

EXPOSE 5555
EXPOSE 6666
EXPOSE 7777
ENTRYPOINT /bin/listener
