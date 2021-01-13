# ethernetes
Learning more about crypto, trading, and deep learning with GPUs and K8s.


## Getting Started

### Requirements

- Ubuntu 18.04
- docker
- [CUDA drivers](https://askubuntu.com/questions/1099015/how-to-install-latest-version-of-cuda-on-ubuntu-18-04)
- [nvidia-docker2](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit)

### Mining


```bash
docker login ghcr.io
nvidia-docker run -p 127.0.0.1:3333:3333/tcp --restart=always --detach=true --gpus=0 --name=ethminer ghcr.io/hfuss/miner:latest
```

### Logs

```bash
docker logs ethminer
```

### GPU Stats

```bash
nvidia-docker run -d --gpus=all \
  --restart always \
  --name datadog-agent \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /proc/:/host/proc/:ro \
  -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  -v /opt/datadog-agent-conf.d:/conf.d:ro \
  -v /opt/datadog-agent-checks.d:/checks.d:ro \
  -e DD_API_KEY=${DD_API_KEY} \
  -e DD_SITE=datadoghq.com \
  ghcr.io/hfuss/datadog-agent:latest
```
