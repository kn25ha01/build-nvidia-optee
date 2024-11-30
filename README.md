# Build NVIDIA OP-TEE

## Requirements

* Jetson AGX Xavier series
* JetPack SDK v5.1.3
* Jetson Linux v35.5.0

## Directories

```tree -L 1 -a
├── .git
├── .gitignore
├── Dockerfile
├── Linux_for_Tegra
├── README.md
├── aarch64--glibc--stable-final
├── atf_src
├── docker-compose.yml
├── kernel_src
└── nvidia-jetson-optee-source
```

## Building the Docker container

```
docker-compose up -d
docker exec -it nvoptee /bin/bash
```

## 1. Building the OP-TEE source code

```
cd nvidia-jetson-optee-source
./optee_src_build.sh -p t194
```

## 2. Building the OP-TEE dtb

```
dtc -I dts -O dtb -o ./optee/tegra194-optee.dtb ./optee/tegra194-optee.dts
```

## 3. Building the ATF source code with OP-TEE SPD

```
cd ../atf_src/arm-trusted-firmware
make BUILD_BASE=./build CROSS_COMPILE="${CROSS_COMPILE_AARCH64}" DEBUG=0 LOG_LEVEL=20 PLAT=tegra SPD=opteed TARGET_SOC=t194 V=0
cd ../..
```

## Reference

* nvidia-jetson-optee-source/optee/atf_and_optee_README.txt
