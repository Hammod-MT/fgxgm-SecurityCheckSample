FROM node:21.4-bookworm-slim
RUN apt-get update \
    && apt-get install -y perl/perl-base@5.36.0-7+deb12u1 \
    && rm -rf /var/lib/apt/lists/*
FROM node:14

RUN apt-get update && \
    apt-get install -y zlib1g=1:1.2.13.dfsg-1 && \
    rm -rf /var/lib/apt/lists/*
    
RUN npm install -g npm@9.1.3

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
