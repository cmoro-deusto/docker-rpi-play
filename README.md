docker-rpi-play
===============

This is a minimal docker container based on Hypriot Debian Raspberry Pi image for Play Framework development!

# Description
You should run this container interactivelly and launch activator console commands from within your play projects directories.

Includes:

 - Oracle JDK 1.8
 - Typesafe Activator 1.3.2
 - Git, wget, curl, build-essential

## Users
A user named `play` is created with sudoers privileges. Home is at `/home/play`.

## Volumes
Exports a volume on `/home/play/Code`.
You can mount the volume on run to a local directory containing your code. If you run into problems, check file ownerships.

### ivy2 and sbt caches

Java `user.home` variable is defined, pointing to `/home/play/Code`.
In this way, all dependencies are kept if you mount the `/home/play/Code` volume on `/home/play/Code/.ivy2` and `/home/play/Code/.sbt` directories.

## Ports
Three ports are exposed:
 - 9000: default Play port.
 - 9999: default Play debug port.
 - 8888: default Activator UI port.

Remember to map the ports to the docker host on run.

# How to run the container
## Using docker
To get the container up and running and drop to an interactive shell, run:
 
```
sudo docker run --rm -it -v "/home/dordoka/Code:/home/play/Code" -p 9000:9000 -p 9999:9999 -p 8888:8888 dordoka/rpi-play
```
Remember to change `/home/dordoka/Code` to the directory where your code is stored.

# Links

- [Source Repository](https://github.com/cmoro-deusto/docker-rpi-play)
- [Dockerfile](https://github.com/cmoro-deusto/docker-rpi-play/blob/master/Dockerfile)
- [DockerHub](https://registry.hub.docker.com/u/dordoka/rpi-play/)


## Happy Play coding on your Raspberry Pi! :)
