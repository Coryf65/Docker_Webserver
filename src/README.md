# Docker

1. Create a 'Dockerfile'
    - example nginx 'Dockerfile'

2. build container

*build inside the directory of the dockerfile*
```bash
docker build -t webserver-nginx .
```

3. Get the images id for use later
```bash
docker images
```

4. Run docker as a container

*Docker run as a daemon '-d' on ports '-p' 80 to inside the container on 80 '80:80' using this image ID 'image id'* 
```bash
docker run -d -p 80:80 01a7103a7e76
```

5. Now we can see what containers we are running

```bash
docker ps
```

6. Stop a container

*get the image id to stop our container*
```bash
docker stop 01a7103a7e76
```