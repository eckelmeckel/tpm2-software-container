ENV LD_LIBRARY_PATH=/usr/local/lib64
ENV PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig
#RUN printenv > /env.txt
ARG CURL_VERSION=7.80.0

## fetch and install cURL
RUN wget --no-verbose -O "/tmp/curl-${CURL_VERSION}.tar.gz" "https://curl.se/download/curl-${CURL_VERSION}.tar.gz"
RUN tar -zxf "/tmp/curl-${CURL_VERSION}.tar.gz" --one-top-level=/tmp/
WORKDIR "/tmp/curl-${CURL_VERSION}"
RUN autoreconf -fi \
	&& ./configure --with-openssl \
	&& make -j"$(nproc)" \
	&& make install \
	&& ldconfig
#RUN rm -fr "/tmp/curl-${CURL_VERSION}"
