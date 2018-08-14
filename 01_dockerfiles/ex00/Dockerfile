# From an alpine image you’ll add to your container your favorite text editor,
# vim or emacs, that will launch along with your container.

FROM alpine
MAINTAINER okuznets <okuznets@student.unit.ua>
RUN apk update && \
    apk upgrade && \
    apk add vim
CMD vim
