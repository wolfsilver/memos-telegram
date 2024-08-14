FROM alpine:3.20

LABEL maintainer="mxoxw.com telegram-memos"

ARG VERSION=v0.1.1
ARG ARCH=linux_amd64

ARG BASE_URL=https://github.com/usememos/telegram-integration

WORKDIR /root
# https://github.com/usememos/telegram-integration/releases/download/v0.1.1/memogram_v0.1.1_linux_amd64.tar.gz
RUN set -x ; apk add --no-cache libc6-compat \
    && cd /root \
    && wget ${BASE_URL}/releases/download/${VERSION}/memogram_${VERSION}_${ARCH}.tar.gz -O tmp.tar.gz \
    && tar -zxvf tmp.tar.gz \
    &&  chmod +x memogram \
    && rm -rf tmp.tar.gz \
    && touch .env

ENV PATH="/root:${PATH}"

# ENTRYPOINT ["memogram"]
CMD ["memogram"]
