FROM node:14-alpine as build-deps
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . ./

FROM build-deps as test
WORKDIR /usr/src/app
RUN yarn test

FROM build-deps
WORKDIR /usr/src/app
EXPOSE 8080
CMD ["yarn", "start"]
