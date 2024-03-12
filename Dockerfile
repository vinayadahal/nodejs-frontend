FROM alpine:latest
WORKDIR /frontend
RUN apk add nodejs npm
COPY frontend /
RUN ["npm","install"]
CMD ["npm", "start"]
EXPOSE 3000
