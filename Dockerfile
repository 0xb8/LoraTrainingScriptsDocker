FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y python3-tk python3-pip libnvidia-gl-525 libglib2.0-0 nano git
RUN python3 -m pip install torch torchvision nvidia-tensorrt==8.4.1.5 --extra-index-url https://download.pytorch.org/whl/cu116
RUN python3 -m pip install --pre -U xformers triton

WORKDIR /root/
RUN git clone --recurse-submodules -b old-scripts https://github.com/derrian-distro/LoRA_Easy_Training_Scripts

COPY requirements.txt /root/LoRA_Easy_Training_Scripts/sd_scripts/requirements.txt
WORKDIR /root/LoRA_Easy_Training_Scripts/sd_scripts/
RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install ../LyCORIS/.
RUN python3 -m pip install lion-pytorch dadaptation

# fix libcudart.so not being found by bitsandbytes 
RUN ln -s /usr/local/cuda/lib64/libcudart.so.11.0 /usr/local/lib/python3.10/dist-packages/nvidia/cuda_runtime/lib/libcudart.so
ENV LD_LIBRARY_PATH=/usr/local/lib/python3.10/dist-packages/nvidia/cuda_runtime/lib/:/usr/local/lib/python3.10/dist-packages/tensorrt

WORKDIR /sd
ENTRYPOINT ["accelerate", "launch", "/root/LoRA_Easy_Training_Scripts/main.py"]
