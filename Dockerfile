# Use an existing base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /build

# Copy the package.json and yarn.lock files to the container
COPY package.json yarn.lock /build/

# Install dependencies using Yarn
RUN yarn install

COPY . /build/

CMD ["node", "script.js"]
