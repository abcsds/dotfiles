Some useful container notes

Installation:
```
sudo groupadd docker
sudo usermod -aG docker $USER
```

# Images

wine: https://github.com/yantis/docker-wine


gotty https://github.com/yudai/gotty
https://github.com/hyeonsangjeon/gotty-docker
```
gotty -w docker run -it --rm busybox
docker run -p 8989:8080 -d --name gotty -it --mount type=bind,source="$(pwd)",target=/home/root modenaf360/gotty:latest
```


stylegan https://github.com/NVlabs/stylegan2-ada-pytorch
```
sudo docker build -t stylegan .
sudo docker run -it --gpus all --name stylegan --shm-size=12g --mount type=bind,source="$(pwd)",target=/workspace stylegan bash

sudo docker rm $(sudo docker ps -aq)

python dataset_tool.py --transform=center-crop-wide --source ./data/img/ --dest ./ds.zip --width=512 --height=512
python train.py --outdir=./training-runs --data=./ds.zip --gpus=1 --mirror True --resume ./training-runs/00007-ds-mirror-auto1/network-snapshot-000800.pkl


faces
python dataset_tool.py --transform=center-crop-wide --source ./data/faces/ --dest ./ds.zip --width=512 --height=512
python train.py --outdir=./training-runs --data=./ds.zip --gpus=1 --mirror True --snap 5


sudo docker run -it --gpus all --name stylegan --shm-size 14g --mount type=bind,source="$(pwd)",target=/workspace stylegan bash
```


kali kalilinux/kali-rolling
```
docker run -it --rm kalilinux/kali-rolling --name kali /bin/zsh
```

jupyter https://github.com/jupyter/docker-stacks
```
docker run -p 8888:8888 jupyter/scipy-notebook:33add21fab64
```

colab nvidia: https://hub.docker.com/r/sorokine/docker-colab-local
```
docker run \
  --runtime=nvidia \
  -it --rm -p 8081:8081 \
  -v "$PWD":/opt/colab \
  -v $HOME/.cache/torch:/root/.cache/torch \
  sorokine/docker-colab-local:latest
```

Julia nvidia https://ngc.nvidia.com/catalog/containers/hpc:julia
```
docker run -it --rm --name julia nvcr.io/hpc/julia:v2.4.1
```

code-server (web-based IDE): https://github.com/cdr/code-server


ML-workspace: https://github.com/ml-tooling/ml-workspace
```
docker run -d \
    -p 8080:8080 \
    --gpus all \
    --name "ml-workspace" \
    -v "${PWD}:/workspace" \
    --shm-size 12g \
    --restart always \
    mltooling/ml-workspace:0.12.1
```

Project Management
restyaboard: https://hub.docker.com/r/restyaplatform/restyaboard/
```
git clone https://github.com/cangeli/docker-restyaboard
cd docker-restyaboard
git checkout alpine
docker-compose up -d
```
vikunja: https://vikunja.io/docs/full-docker-example/
focalboard: https://www.focalboard.com/download/personal-edition/docker/
```
docker run -it -p 80:8000 mattermost/focalboard
```

Is cuda available?
```
sudo docker run --gpus all pytorch/pytorch:latest python -c "import torch; print(torch.cuda.is_available())"
```
