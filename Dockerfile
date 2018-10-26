FROM node:alpine as builder
WORKDIR  '/reshma'
COPY package.json .
RUN npm install
##RUN apk add --no-cache bash
##RUN apk add nano
COPY . .
RUN npm run build


FROM nginx
##the expose instruction is only for the aws beanstalk to understand tht it needs to open port 80 for this
##appln to work as expected.
EXPOSE 80

COPY --from=builder /reshma/build /usr/share/nginx/html
##FROM redis
##COPY redis.conf /usr/local/etc/redis/redis.conf
##COPY --from=builder /app/build /usr/local/etc/redis/redis.conf

##CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]