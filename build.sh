#!/bin/sh

set -eu

if hash podman 2>/dev/null; then
  docker=podman
else
  docker=docker
fi

if [ -r .env ]; then
  set -a
  . ./.env
  set +a
fi

if [ $# -lt 1 ]; then
  echo "USAGE: $0 <anki version>"
  exit
fi

exec podman build --build-arg=ANKI_VERSION="$1" -t "${REGISTRY}/anki:$1" .
