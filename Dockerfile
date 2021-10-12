FROM node:latest AS builder
WORKDIR /app
COPY ./landing/package.json ./
RUN yarn
COPY ./landing ./
RUN yarn build
#CMD ["yarn", "build"]

FROM nginx:1.19-alpine AS server
COPY --from=builder ./app/build /usr/share/nginx/html
COPY  ./nginx/nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]
#RUN yarn global add serve && serve -s build
