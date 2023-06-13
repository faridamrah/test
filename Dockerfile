# Use an existing base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json yarn.lock /app/

# Install dependencies using Yarn
RUN yarn install

# Copy the Node.js script to the container
COPY script.js /app/

# Specify the command to run the Node.js script
CMD ["node", "script.js"]
