FROM asciidoctor/docker-asciidoctor


RUN apk --no-cache --update add \
                            build-base \
                            ruby-rdoc \
                            ruby-bundler \
                            ruby-dev
RUN gem install guard guard-shell guard-livereload rouge asciidoctor pdf-reader:2.2.0 guard guard-shell guard-livereload --no-ri && \
    gem install asciidoctor-pdf --pre && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

RUN mkdir /.gem/
RUN chown 1001 /.gem/ && chgrp 1001 /.gem
RUN chown 1001 /.gem/ && chgrp 1001 /.gem

USER 1001:1001


