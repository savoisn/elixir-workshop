FROM asciidoctor/docker-asciidoctor


RUN apk --no-cache --update add \
                            build-base \
                            ruby-rdoc \
                            ruby-bundler \
                            ruby-dev && \
    gem install pdf-reader:2.2.0 guard guard-shell guard-livereload --no-ri && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

RUN mkdir /.gem/
RUN chown 1000 /.gem/ && chgrp 1000 /.gem
RUN chown 1000 /.gem/ && chgrp 1000 /.gem

USER 1000:1000


