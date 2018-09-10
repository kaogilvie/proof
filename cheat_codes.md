### Docker & Volumes

#### Docker
- Build an image
  - `docker build [directory where dockerfile is] --tag [name]`
- Run an image with a volume
  - `docker run [tag name] --mount type=bind,src=[absolute path],target=[path in container]`

#### Docker-compose
- Build an image
  - `docker-compose up --build [service name]`
