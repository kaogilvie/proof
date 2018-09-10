### Docker & Volumes

#### Docker
- Build an image
  - `docker build [directory where dockerfile is] --tag [name]`
- Run an image with a volume
  - `docker run --mount type=bind,src=[absolute path],target=[path in container] [tag name]`

#### Docker-compose
- Build an image
  - `docker-compose up --build [service name]`
- Have not been able to get mounts to work with docker-compose
