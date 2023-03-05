# https://github.com/awesome-containers/static-bash
ARG STATIC_BASH_VERSION=5.2.15
ARG STATIC_BASH_IMAGE=ghcr.io/awesome-containers/static-bash

# https://github.com/awesome-containers/alpine-build-essential
ARG BUILD_ESSENTIAL_VERSION=3.17
ARG BUILD_ESSENTIAL_IMAGE=ghcr.io/awesome-containers/alpine-build-essential


FROM $STATIC_BASH_IMAGE:$STATIC_BASH_VERSION AS static-bash
FROM $BUILD_ESSENTIAL_IMAGE:$BUILD_ESSENTIAL_VERSION AS build

# https://git.savannah.gnu.org/cgit/diffutils.git
ARG DIFFUTILS_VERSION=3.9

WORKDIR /src/diffutils
RUN set -xeu; \
    curl -#Lo diffutils.tar.xz \
        "https://ftp.gnu.org/gnu/diffutils/diffutils-$DIFFUTILS_VERSION.tar.xz"; \
    tar -xvf diffutils.tar.xz --strip-components=1; \
    rm -f diffutils.tar.xz

ARG CFLAGS='-w -g -Os -static'
RUN set -xeu; \
    ./configure; \
    make -j"$(nproc)"; \
    mkdir bin; \
    cp src/diff src/diff3 src/sdiff src/cmp bin/ ;\
    strip -s -R .comment --strip-unneeded bin/*; \
    chmod -cR 755 bin/*; \
    chown -cR 0:0 bin/*; \
    ! ldd src/diff && :; \
    ./bin/diff --version

# static diffutils image
FROM static-bash
COPY --from=build /src/diffutils/bin/ /bin/
