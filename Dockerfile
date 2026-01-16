FROM mayanedms/mayanedms:latest

USER root

# Crear directorios necesarios
RUN mkdir -p /var/lib/mayan /var/lib/mayan/media /var/lib/mayan/static \
    && chown -R mayan:mayan /var/lib/mayan

# Cambiamos definitivamente al usuario mayan
USER mayan

# ⚠️ Saltamos el entrypoint original
ENTRYPOINT []

# Arrancamos Mayan directamente
CMD ["gunicorn", \
     "--bind", "0.0.0.0:8000", \
     "--workers", "1", \
     "mayan.wsgi"]
