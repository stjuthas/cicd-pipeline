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
