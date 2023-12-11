FROM oven/bun:latest

ARG NODE_VERSION=18
RUN apt-get update && apt-get install -y unzip curl
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n \
    && bash n $NODE_VERSION \
    && rm n \
    && npm install -g n

WORKDIR /app

COPY package.json ./
COPY bun.lockb ./

RUN bun install

COPY . .

RUN bunx prisma generate

ENV NODE_ENV production

ENTRYPOINT ["bun", "start"]