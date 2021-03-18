FROM node:latest AS build
RUN mkdir -p /home/app
COPY . /home/app
WORKDIR /home/app
RUN yarn install && \
    yarn build

FROM nginx:alpine
COPY --from=build /home/app/build/ /usr/share/nginx/html/

EXPOSE:80

CMD ["npm","start"]