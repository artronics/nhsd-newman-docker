FROM python:3.8-slim as template

RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM node:stretch-slim as test_runner

COPY package.json index.js /home/node/app/
WORKDIR /home/node/app
RUN npm install

ADD entrypoint.sh /usr/bin
ENTRYPOINT ["entrypoint.sh"]
