FROM texlive/texlive:latest

WORKDIR /latex

RUN tlmgr update --self

RUN tlmgr install latexmk import && \
    apt-get update && \
    apt-get install -y curl tar xz-utils && \
    rm -rf /var/lib/apt/lists/*

ARG WATCHEXEC_ARCH_NAME
ENV WATCHEXEC_ARCH_NAME=$WATCHEXEC_ARCH_NAME

ARG WATCHEXEC_VERSION
ENV WATCHEXEC_VERSION=$WATCHEXEC_VERSION

RUN curl -L https://github.com/watchexec/watchexec/releases/download/v${WATCHEXEC_VERSION}/watchexec-${WATCHEXEC_VERSION}-${WATCHEXEC_ARCH_NAME}.tar.xz -o /tmp/watchexec.tar.xz

RUN tar -xJf /tmp/watchexec.tar.xz -C /tmp

RUN mv /tmp/watchexec-${WATCHEXEC_VERSION}-${WATCHEXEC_ARCH_NAME}/watchexec /usr/local/bin/watchexec

RUN rm -rf /tmp/watchexec.tar.xz && rm -rf /tmp/watchexec-${WATCHEXEC_VERSION}-${WATCHEXEC_ARCH_NAME}/
   
RUN chmod +x /usr/local/bin/watchexec

COPY watch-compile.sh /usr/local/bin/watch-compile.sh
RUN chmod +x /usr/local/bin/watch-compile.sh

CMD [ "watch-compile.sh" ]
