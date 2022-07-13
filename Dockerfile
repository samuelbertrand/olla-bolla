FROM node:16-bullseye as build
WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn
COPY ./ /app/
RUN npm run build
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/build/ /usr/share/nginx/html/