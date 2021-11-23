ARG ibmtpm_name=ibmtpm1661
COPY patches/ibmtpm1661.ossl3.patch /tmp/ibmtpm1661.ossl3.patch
RUN cd /tmp \
	&& wget $WGET_EXTRA_FLAGS -L "https://downloads.sourceforge.net/project/ibmswtpm2/${ibmtpm_name}.tar.gz" \
	&& sha256sum "${ibmtpm_name}.tar.gz" | grep ^55145928ad2b24f34be6a0eacf9fb492e10e0ea919b8428c721fa970e85d6147 \
	&& mkdir -p "${ibmtpm_name}" \
	&& tar xv --no-same-owner -f "${ibmtpm_name}.tar.gz" -C "${ibmtpm_name}" \
	&& rm "${ibmtpm_name}.tar.gz" \
	&& cd "${ibmtpm_name}/" \
	&& patch -d ./ -p1 < /tmp/ibmtpm1661.ossl3.patch \
	&& cd "src/" \
	&& sed -i 's/-DTPM_NUVOTON/-DTPM_NUVOTON $(CFLAGS)/' makefile \
	&& CFLAGS="-DNV_MEMORY_SIZE=32768 -DMIN_EVICT_OBJECTS=7" make -j"$(nproc)" \
	&& cp tpm_server /usr/local/bin \
	&& rm -fr "/tmp/${ibmtpm_name}"
