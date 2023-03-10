# [Lora Training Scripts](https://github.com/derrian-distro/LoRA_Easy_Training_Scripts) Docker recipe for Linux

Install the NVIDIA container toolkit (sample instructions for Ubuntu 22.x are in [prepare_os/ubuntu22.10](prepare_os/ubuntu22.10)

Then just run `docker compose run --build app <args for main.py>...` in this repo.

## Convenience folders
It is suggested to place SD models and training datasets in the respective folders in this repo.  
They are mounted at `/sd/` inside the container (see `docker-compose.yml`), so you need to change the paths in your `*.json` files accordingly.
