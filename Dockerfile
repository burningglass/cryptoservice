# Smallest official Node.js image compatible with dependencies
#  (Alpine images not officially supported, use recent LTS version of an official image)
FROM node:16.17.0-bullseye-slim

# Create app directory (see: https://www.pathname.com/fhs/pub/fhs-2.3.html#PURPOSE23)
WORKDIR /usr/local/src

# Package.json*.json specify NPM packages used by app
# Package-lock.json stipulates specific versions of required packages
# where available (npm@5+)
COPY package*.json /usr/local/src/

# Option 1. Install for Production?, i.e. install strictly per package-lock.json, deleting node_modules beforehand
RUN npm ci --only=production

# Option 2. Install only for Development?
# RUN npm install

# Install app source
COPY ./app/* /usr/local/src/app/

EXPOSE 8080
CMD [ "node", "app/index.js" ]