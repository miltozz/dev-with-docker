FROM node:16-alpine

RUN mkdir -p /home/app

COPY . /home/

# set default dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]

