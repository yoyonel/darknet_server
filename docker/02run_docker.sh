cd ..
docker run \
    -it \
    --rm \
    -p 8080:8080 \
    -v "${PWD}/conf:/opt/darknet_server/conf" \
    --runtime=nvidia \
    --name darknet_python_server \
    docker_darknet_python_server
