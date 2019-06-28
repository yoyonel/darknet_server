# Docker image: nvidia/cuda
https://hub.docker.com/r/nvidia/cuda/tags?page=2
9.2-devel-ubuntu18.04 1 GB

# Docker build problem
https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai

Avoiding user interaction with tzdata when installing certbot in a docker container

> For example, you can set it in Dockerfile using ARG:
>
> ARG DEBIAN_FRONTEND=noninteractive

in `docker/Dockerfile`:
```Dockerfile
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
```
# run yolov3 with GPU:CUDA Error: out of memory
https://github.com/pjreddie/darknet/issues/791

> @dayn9t I think your gpu is low in memory. when Yolov3 fully loaded to gpu, it takes about 1600MB memory by default setting(416*416) on my computer, plus 300ish MiB from display and other applications, it is very like it will throw out OOM error. Try to run on a gpu with larger memory or reduce the width and height setting in your cfg file(Note: reducing the size might impact your detection results.).

> I had the same problem with a GT740M with 4096Mo GDDR4 memory. Nvidia 384.130, Cuda 9, CUDNN, OpenCV 3.3.
>
> My solution to run Yolov3 perfectly was to : modify the cfg/yolov3.cfg :
>
> batch=1
> subdivisions=1
> width=416
> height=416

from https://github.com/pjreddie/darknet/blob/master/cfg/yolov3.cfg to `docker/cfg/yolov3.cfg`:
```ini
[net]
# Testing
# VRAM issue
batch=1
subdivisions=1
width=416
height=416
# Training
#batch=64
#subdivisions=16
#width=608
#height=608
...
```
