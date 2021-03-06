FROM node:10.15-slim

ENV NODE_SOURCE /usr/src/

WORKDIR $NODE_SOURCE

COPY . $NODE_SOURCE

RUN buildDeps=' \
        gcc \
        make \
        python \
        ' \
        && rm -rf /var/lib/apt/lists/* \
        && yarn install \
        && yarn build

EXPOSE 8080
CMD ["yarn", "start"]
