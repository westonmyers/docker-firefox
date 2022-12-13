FROM debian:bullseye-slim
ENV firefox_version=63.0.3
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -y \
  xcb \
  xauth \
  libpci3 \
  qt5dxcb-plugin \
  curl \
  bzip2 \
  libdbus-glib-1-2 && \
  mkdir /opt/firefox && \
  curl -o- https://ftp.mozilla.org/pub/firefox/releases/$firefox_version/linux-x86_64/en-US/firefox-$firefox_version.tar.bz2 | \
  tar -C /opt/firefox --strip-components=1 -xvj && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -mU firefox
USER firefox
CMD xauth add $XAUTH_COOKIE && \
  /opt/firefox/firefox-bin
