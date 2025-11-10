FROM texlive/texlive:latest

WORKDIR /latex

RUN tlmgr update --self

RUN tlmgr install latexmk import && \
    apt-get update && \
    apt-get install -y curl tar xz-utils && \
    rm -rf /var/lib/apt/lists/*

ENV ARCH=aarch64-unknown-linux-gnu
ENV WATCHEXEC_VERSION=2.3.2

RUN curl -L https://github.com/watchexec/watchexec/releases/download/v${WATCHEXEC_VERSION}/watchexec-${WATCHEXEC_VERSION}-${ARCH}.tar.xz -o /tmp/watchexec.tar.xz

RUN tar -xJf /tmp/watchexec.tar.xz -C /tmp

RUN mv /tmp/watchexec-${WATCHEXEC_VERSION}-${ARCH}/watchexec /usr/local/bin/watchexec

RUN rm -rf /tmp/watchexec.tar.xz && rm -rf /tmp/watchexec-${WATCHEXEC_VERSION}-${ARCH}/
   
RUN chmod +x /usr/local/bin/watchexec

COPY watch-compile.sh /usr/local/bin/watch-compile.sh
RUN chmod +x /usr/local/bin/watch-compile.sh

CMD [ "watch-compile.sh" ]
