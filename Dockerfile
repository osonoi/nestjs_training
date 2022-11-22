# Base image
# FROM registry.access.redhat.com/ubi8/nodejs-16
FROM quay.io/upslopeio/node-alpine


# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN chmod -R 775 /usr/src/app
RUN chown -R node:root /usr/src/app

# Install app dependencies
RUN npm ci

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
CMD ["npm", "start"]
