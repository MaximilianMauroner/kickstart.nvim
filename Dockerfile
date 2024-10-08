# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set non-interactive mode for APT
ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential packages, including sudo
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python3 \
    python3-pip \
    ansible \
    git \
    curl \
    vim \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user 'maxi' with password 'maxi' and add to the sudo group
RUN useradd -m -s /bin/bash maxi && \
    echo "maxi:maxi" | chpasswd && \
    adduser maxi sudo && \
    mkdir -p /home/maxi/.config/nvim && \
    chown -R maxi:maxi /home/maxi

# Set the home directory for the user
ENV HOME=/home/maxi

# Switch to the new user
USER maxi

WORKDIR $HOME

RUN git clone https://github.com/MaximilianMauroner/kickstart.nvim /home/maxi/.config/nvim

# Default command (can be overridden)
CMD ["bash"]
