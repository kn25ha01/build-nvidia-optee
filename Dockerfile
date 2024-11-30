# https://optee.readthedocs.io/en/latest/building/prerequisites.html
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install -y \
    adb \
    acpica-tools \
    autoconf \
    automake \
    bc \
    bison \
    build-essential \
    ccache \
    cpio \
    cscope \
    curl \
    device-tree-compiler \
    e2tools \
    expect \
    fastboot \
    flex \
    ftp-upload \
    gdisk \
    git \
    libattr1-dev \
    libcap-ng-dev \
    libfdt-dev \
    libftdi-dev \
    libglib2.0-dev \
    libgmp3-dev \
    libhidapi-dev \
    libmpc-dev \
    libncurses5-dev \
    libpixman-1-dev \
    libslirp-dev \
    libssl-dev \
    libtool \
    libusb-1.0-0-dev \
    make \
    mtools \
    netcat \
    ninja-build \
    python3-cryptography \
    python3-pip \
    python3-pyelftools \
    python3-serial \
    python-is-python3 \
    rsync \
    swig \
    unzip \
    uuid-dev \
    wget \
    xdg-utils \
    xterm \
    xz-utils \
    zlib1g-dev
#RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo
#RUN mkdir /optee
#WORKDIR /optee
#RUN repo init -u https://github.com/OP-TEE/manifest.git -m qemu_v8.xml && repo sync -j10
#WORKDIR /optee/build
#RUN make -j2 toolchains
#RUN make -j$(nproc) check

# my config
RUN mkdir /optee
WORKDIR /optee
ENV CROSS_COMPILE_AARCH64_PATH=/optee/aarch64--glibc--stable-final
ENV CROSS_COMPILE_AARCH64=/optee/aarch64--glibc--stable-final/bin/aarch64-buildroot-linux-gnu-
ENV UEFI_STMM_PATH=/optee/Linux_for_Tegra/bootloader/standalonemm_optee_t194.bin
