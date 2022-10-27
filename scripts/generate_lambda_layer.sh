#!/bin/bash

# Define environment variables for Docker
container_name=python-qrcode-image-dependencies-layer-py39
docker_image=python-qrcode-image-dependencies-layer-image-py39


# Build Docker image (The Dockerfile is in the parent directory, that's why we have the "../" to access it)
docker build -t $docker_image ../

# Run Docker image and create a container from that image
docker run -td --name=$container_name $docker_image

# Execute "container_commands.sh" script inside the previously created container
docker exec -i $container_name /bin/bash < ./container_commands.sh

# Copy the zipped file created inside the container to our local machine
docker cp $container_name:/root/python.zip python.zip

# Stop the container
docker stop $container_name

# Delete/remove the container
docker rm $container_name
