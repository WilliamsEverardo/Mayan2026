FROM mayanedms/mayanedms:latest

USER root

RUN mkdir -p /var/lib/mayan \
    && chown -R mayan:mayan /var/lib/mayan

USER mayan
