### Docker & Volumes

#### Docker
- Build an image
  - `docker build [directory where dockerfile is] --tag [name]`
- Run an image with a volume
  - `docker run --mount type=bind,src=[absolute path],target=[path in container] [tag name]`
- Run an image with a published port
  - `docker run -p [docker_port]:[host_port] --name [container_name][tag_name]`
  - to run neo4j, you must expose the browser port and the protocol port
- To ssh into a docker container and run scripts
  - `docker exec -it [container_id/name] /bin/bash`

#### Docker-compose
- Build an image
  - `docker-compose up --build [service name]`
- Have not been able to get mounts to work with docker-compose
