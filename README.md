# cicd-pipeline
How to Build a Docker Jenkins Pipeline to Implement CI/CD Workflow

Added a nodejs server script for cicd pipeline.

Running the project manually
cd into the app folder
run below to install node modules
```
npm install
```
run below ro start the app
```
node server.js
```

Creating docker image
FROM node:14
# Create app directory
WORKDIR /user/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# Where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
