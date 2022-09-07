# build docker image

```shellscript
docker build -t IMAGE_NAME -f Dockerfile .
```

# check docker image

```shellscript
docker images
```

# run container with detached mode

```shellscript
docker run -dit ID_IMAGE bash
```

# check container

```shellscript
docker ps -a
```

# enter shell container

```shellscript
docker exec -it ID_CONTAINER bash
```
