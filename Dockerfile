FROM phusion/baseimage:0.9.19

LABEL maintainer="carusot42@gmail.com"

RUN apt update -y

 # Dependencies for Python build
# Install in tiers so one failure doesn't kill them all.
RUN apt install -y \ 
        libssl-dev \
        zlib1g-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev
    
RUN apt install -y \
        libgdbm-dev \
        libdb5.3-dev \
        libbz2-dev \
        libexpat1-dev \
        liblzma-dev \
        tk-dev

# Need curl and build-essential to download & build Python source
RUN apt install -y \
        build-essential \
        curl

COPY install_python.sh install_python.sh

# Build python from source
RUN ./install_python.sh

RUN curl -L https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
# final set of dependencies. They're down here so an addition doesn't trigger a full install of Python.
RUN apt update -y && apt install -y \
        postgresql-client-10 \
        libpq-dev

# Create some symbolic links for convenience
RUN ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
