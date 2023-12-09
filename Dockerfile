FROM node:21.4-bookworm-slim

# Upgrade perl/perl-base to fix security issue
RUN apt-get update \
    && apt-get install -y perl/perl-base@5.36.0-7+deb12u1 \
    && rm -rf /var/lib/apt/lists/*

# Update npm to version 9.1.3
RUN npm install -g npm@9.1.3

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Expose the port on which the app will run
EXPOSE 8080

# Define the command to run your application
CMD ["node", "index.js"]
