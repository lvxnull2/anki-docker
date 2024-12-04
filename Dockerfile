FROM python:3.13-slim

ARG ANKI_VERSION

RUN pip3 install --break-system-packages --no-cache-dir --root-user-action ignore anki==$ANKI_VERSION

ENV SYNC_PORT=8080 SYNC_BASE=/data

EXPOSE 8080
VOLUME /data

CMD ["python3", "-m", "anki.syncserver"]
