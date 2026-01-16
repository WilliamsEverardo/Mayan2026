FROM mayanedms/mayanedms:latest

USER root

RUN mkdir -p /var/lib/mayan /var/lib/mayan/media /var/lib/mayan/static \
    && chown -R mayan:mayan /var/lib/mayan

USER mayan

# Saltamos entrypoint original (clave para Railway)
ENTRYPOINT []

# Arranque correcto de Mayan
CMD ["python", "-m", "gunicorn", \
     "--bind", "0.0.0.0:8000", \
     "--workers", "1", \
     "mayan.wsgi"]
