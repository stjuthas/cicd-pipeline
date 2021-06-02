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

# Bundle app source
COPY . .

# Run on port 8080
EXPOSE 8500

CMD ["node", "server.js"]

### Building your image
### Go to the directory that has your Dockerfile and run the following command to build the Docker image. The -t flag ### lets you tag your image so it's easier to find later using the docker images command:
```
docker build . -t <your username>/node-web-app
```

### Your image will now be listed by Docker:
```
docker images
```

### Run the image
### Running your image with -d runs the container in detached mode, leaving the container running in the background. ### The -p flag redirects a public port to a private port inside the container. Run the image you previously built:
```
docker run -p 49160:8080 -d <your username>/node-web-app
```

```
docker ps
```

### Print app output
docker logs <container id>

If you need to go inside the container you can use the exec command:
```
docker exec -it <container id> /bin/bash
```

Test
To test your app, get the port of your app that Docker mapped:

### You can push a new image to this repository using the CLI
docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname


