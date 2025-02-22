FROM ubuntu:latest

LABEL version="0.1.0"
LABEL repository="http://github.com/krook/csv-lint"

RUN apt-get update \
    && apt-get install curl -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L https://github.com/Clever/csvlint/releases/download/v0.3.0/csvlint-v0.3.0-linux-amd64.tar.gz | tar xz -C /usr/local/bin --strip 1 \
    && chmod +x /usr/local/bin/csvlint 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]