FROM node:latest

RUN useradd --user-group --create-home --shell /bin/false app 

ENV HOME=/home/app
ENV SRC=/home/app/src

COPY package.json npm-shrinkwrap.json $HOME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME
RUN npm install

USER root
COPY src/ $SRC/
RUN chown -R app:app $HOME/*
USER app

EXPOSE 3000

CMD ["node", "src/index.js"]
