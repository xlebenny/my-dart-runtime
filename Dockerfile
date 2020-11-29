FROM google/dart-runtime-base:2.12.0-79.0.dev as dart-runtime

FROM golang:1.15.5-alpine3.12 as runtime
COPY --from=dart-runtime /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2

#nslookup
COPY --from=dart-runtime /etc/nsswitch.conf /etc/nsswitch.conf
COPY --from=dart-runtime /etc/hosts /etc/hosts
COPY --from=dart-runtime /etc/resolv.conf /etc/resolv.conf
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libnss_dns.so.2 /lib/x86_64-linux-gnu/libnss_dns.so.2
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/libresolv.so.2
