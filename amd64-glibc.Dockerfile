FROM ghcr.io/varbhat/void-container:glibc as builder
RUN xbps-install -Syu || xbps-install -yu xbps
RUN xbps-install -yu
ARG ARCH=x86_64
ARG XBPS_ARCH=${ARCH}
ARG REPO=https://alpha.de.repo.voidlinux.org
RUN mkdir -p void/var/db/xbps && cp -r /var/db/xbps/keys/ void/var/db/xbps/
RUN xbps-install -SyMU -R ${REPO}/current -r void base-files xbps coreutils busybox-huge bash
RUN for util in $(chroot void busybox --list) ; do [ ! -f /void/usr/bin/$util ] && ln -svf /usr/bin/busybox /void/usr/bin/$util ; done
RUN chroot void mkdir -p /etc/ssl/certs 
RUN chroot void update-ca-certificates --fresh
RUN chroot void xbps-reconfigure -a
RUN chroot void sh -c 'xbps-rindex -c /var/db/xbps/htt*'
RUN rm -fr void/var/cache/xbps void/usr/share/man/*

FROM scratch
ARG ARCH=x86_64
ARG XBPS_ARCH=${ARCH}
ENV XBPS_ARCH=$XBPS_ARCH
COPY --from=builder /void /
ENTRYPOINT ["/usr/bin/sh"]
