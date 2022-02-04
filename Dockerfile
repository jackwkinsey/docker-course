# Set the base image to use for our custom image.
FROM node

# Set the working directory to use for commands (e.g. npm install runs in working directory)
WORKDIR /app

# Copy package.json over and run npm install before copying over other source code.
# This ensures that `npm install` doesn't have to run every time some of the code changes.
COPY package.json /app

# RUN instructions run when the image is being created
RUN npm install

# First path = path in Host file system
# Second path = path in image/container file system
COPY . /app

# Expose port 80 to local system from container.
# This instruction is more for documentation as it is optional.
# However it is recommended to include so it is easy to find what port config to use
# when running the command `docker run <image>`.
# NOTE: if you use the `-P` command to publish all exposed ports then this
# instruction is MANDATORY!
EXPOSE 80

# CMD instructions run when a container is started based on the image
CMD [ "node", "server.js" ]

# If you don't specify a CMD instruction, the CMD of the base image is executed.
# If no base image or CMD are provided, you'll get an error.

# CMD instructions should always be last in your Dockerfile.
