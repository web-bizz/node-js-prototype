# take default image of node boron i.e  node 6.x
FROM node:6.10.1

MAINTAINER Borys Duda

# create app directory in container
RUN mkdir -p /app

# set /app directory as default working directory
WORKDIR /app

# only copy package.json initially so that `RUN yarn` layer is recreated only
# if there are changes in package.json
ADD package.json yarn.lock /app/

# --pure-lockfile: Don’t generate a yarn.lock lockfile
RUN yarn --pure-lockfile

# copy all file from current dir to /app in container
COPY . /app/

# expose port 8000
EXPOSE 8000

# cmd to start service
CMD [ "yarn", "start" ]
