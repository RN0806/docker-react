FROM node:alpine as builder
WORKDIR  '/reshma'
COPY package.json .
RUN npm install
##RUN apk add --no-cache bash
##RUN apk add nano
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /reshma/build /usr/share/nginx/html
##FROM redis
##COPY redis.conf /usr/local/etc/redis/redis.conf
##COPY --from=builder /app/build /usr/local/etc/redis/redis.conf

##CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]