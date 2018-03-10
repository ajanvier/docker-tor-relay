# Run a tor relay in a container
#
FROM alpine:latest
LABEL maintainer "Aurélien JANVIER <dev@ajanvier.fr>"

RUN apk --no-cache add \
	tor

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 9001

# copy in our torrc files
COPY torrc.bridge /etc/tor/torrc.bridge
COPY torrc.middle /etc/tor/torrc.middle
COPY torrc.exit /etc/tor/torrc.exit

# copy the run script
COPY run.sh /run.sh
RUN chmod u+rwx /run.sh

# default environment variables
ENV RELAY_NICKNAME mydockerrelay
ENV RELAY_TYPE middle
ENV RELAY_BANDWIDTH_RATE 100 KBytes
ENV RELAY_BANDWIDTH_BURST 200 KBytes

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

RUN mkdir /var/lib/tor/.tor
VOLUME /var/lib/tor/.tor
RUN chown -R tor /var/lib/tor/.tor

ENTRYPOINT [ "/run.sh" ]
