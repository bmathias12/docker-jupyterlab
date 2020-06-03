# Docker Jupyterlab

Step1: Build the image

`docker build -t bmathias12/docker-jupyterlab .`

Step2: Run the image

``` 
docker run -p 8888:8888 \
    --mount type=bind,source="$(pwd)"/localdata/,target=/home/appuser \
    bmathias12/docker-jupyterlab
```



