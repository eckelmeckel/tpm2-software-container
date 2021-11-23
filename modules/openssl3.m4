ARG openssl_version=openssl-3.0
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
RUN git clone --depth=1 -b "$openssl_version" 'https://github.com/openssl/openssl.git' /tmp/openssl \
	&& cd /tmp/openssl \
	&& ./config \
	&& make -j"$(nproc)" \
	&& make install \
	&& ldconfig
RUN rm -fr /tmp/openssl
