# Use an existing base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /build

# Copy the package.json and yarn.lock files to the container
COPY . $PWD

# Install dependencies using Yarn
RUN yarn install --frozen-lockfile

RUN yarn build

RUN yarn release

FROM nginx:latest
RUN echo  '\n\
    server {\n\
        listen 80 default_server;\n\
        root /usr/share/nginx/html/build;\n\
        index index.html index.htm;\n\
        server_name _;\n\
        location / {\n\
            try_files $uri /index.html;\n\
        }\n\
    }\n' > /etc/nginx/conf.d/default.conf
COPY --from=0 /build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]