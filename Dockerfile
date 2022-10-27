FROM amazonlinux:2

# Update machine
RUN yum update -y

# Install required libraries
RUN yum install -y curl which zip
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel wget
RUN yum install -y tar
RUN cd /opt && wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
RUN yum install -y gzip make
RUN cd /opt && ls && pwd && tar zxvf /opt/Python-3.9.6.tgz
RUN cd /opt/Python-3.9.6 \
    && ./configure --enable-optimizations \
    && make altinstall \
    && rm -f /opt/Python-3.9.6.tgz

# Copy pyproject.toml file to the container (file that contains the project description and the required packages)
COPY pyproject.toml .

# Install Python poetry
RUN curl -sSL https://install.python-poetry.org | python3.9 -

RUN python3.9 -m pip install --upgrade pip

RUN python3.9 -m pip install virtualenv