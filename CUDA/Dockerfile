FROM nvidia/cuda:12.3.2-devel-ubuntu20.04

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get -y install sudo python curl python3-pip neovim tmux git


RUN adduser --disabled-password --gecos '' sh_docker
RUN adduser sh_docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN mkdir -p /home/sh_docker
RUN chown sh_docker /home/sh_docker
USER sh_docker
WORKDIR /home/sh_docker

#Install conda
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
bash ~/Miniconda3-latest-Linux-x86_64.sh -b && rm Miniconda3-latest-Linux-x86_64.sh
RUN eval "$(/home/sh_docker/miniconda3/bin/conda shell.bash hook)" && \
	  conda init

#-p /opt/conda

#Dotfile
RUN git clone https://github.com/shyeonn/.sh_dotfiles.git
RUN bash ~/.sh_dotfiles/setting.sh

#Install pytorch
#RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.5 -c pytorch -c nvidia

CMD /bin/bash
