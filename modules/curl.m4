ARG curl_version=master
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
RUN git clone --depth=1 -b "$curl_version" 'https://github.com/curl/curl.git' /tmp/curl \
	&& cd /tmp/curl \
	&& autoreconf -fi \
	&& ./configure --with-openssl 'LDFLAGS=-L/usr/local/lib64 -L/usr/local/lib -lssl -lcrypto' \
	&& make -j"$(nproc)" \
	&& make install \
	&& ldconfig
RUN rm -fr /tmp/curl
