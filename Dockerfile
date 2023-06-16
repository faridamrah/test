# Use an existing base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /build

# Copy the package.json and yarn.lock files to the container
COPY . $PWD

# Install dependencies using Yarn
RUN yarn install

CMD ["node", "script.js"]
