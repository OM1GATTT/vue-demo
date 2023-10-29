FROM node:lts-alpine AS build

WORKDIR /app

COPY . .
 
RUN npm install

RUN npm run build

FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80