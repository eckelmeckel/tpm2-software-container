FROM ubuntu:20.04

include(`ubuntu_20.04_base_deps.m4')
include(`openssl3.m4')
include(`curl.m4')

include(`pip3.m4')

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
RUN update-alternatives --install /usr/bin/scan-build scan-build /usr/bin/scan-build-10 100

include(`autoconf.m4')
include(`ibmtpm1661.m4')
include(`swtpm.m4')
include(`uthash.m4')
include(`junit.m4')

WORKDIR /
