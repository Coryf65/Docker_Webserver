# Docker

See more really good info [here](https://docs.docker.com/engine/reference/builder/) this is the official docs!

## Building and setting up a local Docker image and container

> NOTE: Some commands may need higher permissions so use `sudo` where needed

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
    
    > See all containers `docker ps -a`

6. Stop a container

    *get the image id to stop our container using 'docker ps'*
    ```bash
    docker stop 84b1bf2f7537
    ```

## More helpful commands

- Remove a container

    *container id from docker ps*
    ```bash
    docker rm 84b1bf2f7537
    ```

- Remove a image

    *image id from docker images*
    ```bash
    docker rmi 01a7103a7e76
    ```
### Bonus helpful commands for Docker

- Find Docker Containers IP Address
    
    *docker inspect {container id} | grep IPAddress*
    ```bash
    docker inspect 84b1bf2f7537 | grep IPAddress
    ```
    *output example*
    ```bash
    "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
    ```

- See running processes, sometimes needed to kill a few to re-build containers

    *see running processes*
    ```bash
    sudo lsof -i
    ```
    
    *kill a process*
    ```bash
    sudo kill {process id}
    ```
    
### Notes on Netowrking from [BMitch](https://stackoverflow.com/questions/43244074/cant-access-publicly-exposed-docker-container-port-from-external-machine-only)

You didn't publicly publish your port with this flag:

-p 127.0.0.1:7091:7091

That flag says to publish on the host 127.0.0.1 interface (localhost), port 7091 to the containers port 7091. The only way to reach that port is to be on the host and connect to the loopback interface.

To publicly publish the port, remove the IP from that flag:

-p 7091:7091

or explicitly publish to all interfaces with:

-p 0.0.0.0:7091:7091

The latter format is identical to the first one as long as you haven't overridden your docker daemon settings with dockerd --ip x.x.x.x or setting the ip value in your /etc/docker/daemon.json file.

    
### A Docker ignore file

> Before the docker CLI sends the context to the docker daemon, it looks for a file named .dockerignore in the root directory of the context. If this file exists, the CLI modifies the context to exclude files and directories that match patterns in it. This helps to avoid unnecessarily sending large or sensitive files and directories to the daemon and potentially adding them to images using ADD or COPY. - Docker Docs

- similar to a '.gitignore' file 

- We can use to ignore local log files, build files, anything we don't want to include
