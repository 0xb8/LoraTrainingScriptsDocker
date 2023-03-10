# Docker installation on Ubuntu 22.10

0. Make sure you have proprietary NVIDIA drivers installed
1. Place `nvidia-container-toolkit-keyring.gpg` into `/usr/share/keyrings/` directory.
2. Place `nvidia-container-toolkit.list` into `/etc/apt/sources.list.d/` directory.
3. Run `sudo apt update` and then `sudo apt install nvidia-container-toolkit`
4. Run `sudo nvidia-ctk runtime configure --runtime=docker`
5. Restart docker daemon: `sudo systemctl restart docker`
6. Test container: `sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi`

If you have issues relating to shared memory limit, try launching container with `--ipc=host` option.

[From NVIDIA docker guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
