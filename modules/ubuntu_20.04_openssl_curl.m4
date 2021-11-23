ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev
