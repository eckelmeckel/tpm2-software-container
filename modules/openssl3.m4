ARG OSSL_VERSION=3.0.0

## fetch and install OpenSSL 3
RUN wget --no-verbose -O "/tmp/openssl-${OSSL_VERSION}.tar.gz" "https://www.openssl.org/source/openssl-${OSSL_VERSION}.tar.gz"
RUN tar -zxf "/tmp/openssl-${OSSL_VERSION}.tar.gz" --one-top-level=/tmp/
WORKDIR "/tmp/openssl-${OSSL_VERSION}"
RUN ./config \
	&& make -j"$(nproc)" \
	&& make install \
	&& ldconfig
#RUN rm -rfv "/tmp/openssl-${OSSL_VERSION}"

