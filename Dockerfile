FROM node:14-alpine

# Create app directory
WORKDIR /usr/src/app
COPY . .
EXPOSE 3000
RUN apk add --no-cache --update --verbose gettext
CMD sh -c "envsubst \"`env | awk -F = '{printf \" \\\\$%s\", $1}'`\" < /usr/src/app/app.js.template > /usr/src/app/app.js && node ./bin/www"
