FROM google/dart-runtime-base:2.7 as dart-runtime

FROM alpine:3.11.3 as runtime
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

