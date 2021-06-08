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


### In this Kubernetes YAML file, we have two objects, separated by the ---:

A Deployment, describing a scalable group of identical pods. In this case, you’ll get just one replica, or copy of your pod, and that pod (which is described under the template: key) has just one container in it, based off of your bulletinboard:1.0 image from the previous step in this tutorial.
A NodePort service, which will route traffic from port 30001 on your host to port 8080 inside the pods it routes to, allowing you to reach your bulletin board from the network.
Also, notice that while Kubernetes YAML can appear long and complicated at first, it almost always follows the same pattern:

The apiVersion, which indicates the Kubernetes API that parses this object
The kind indicating what sort of object this is
Some metadata applying things like names to your objects
The spec specifying all the parameters and configurations of your object.


