FROM node:6-alpine

RUN mkdir -p /src
WORKDIR /src

COPY package.json yarn.lock /src/
RUN yarn
COPY . /src
RUN NODE_ENV=production npm run build
RUN npm prune --production


VOLUME /src

EXPOSE 3000
CMD ["node", "--harmony", "/src/bin/server"]
