FROM python:3.7-slim

RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/* \
    && rm /bin/sh \
    && ln -s /bin/bash /bin/sh \
    && groupadd -r user \
    && useradd --create-home --no-log-init -r -g user user \
    && mkdir /rpc-finder \
    && chown user:user /rpc-finder \
    && apt-get clean \
    && apt-get autoclean

WORKDIR /rpc-finder
USER user

COPY . .

RUN ls . \
    && rm config.yml \
    && python3 -m venv venv \
    && source ./venv/bin/activate \
    && python3 -m pip install --upgrade pip \
    && pip3 install -r requirements.txt --no-cache-dir

ENTRYPOINT ["/rpc-finder/venv/bin/python3", "rpc-finder.py"]