Some useful container notes

gotty https://github.com/yudai/gotty
```
gotty -w docker run -it --rm busybox
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
