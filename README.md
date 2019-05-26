# PlatformIO Docker Build

[![Docker Pulls](https://img.shields.io/docker/pulls/totosan/iot_dev.svg)](https://hub.docker.com/r/totosan/iot_dev/) [![Docker Stars](https://img.shields.io/docker/stars/totosan/iot_dev.svg)](https://hub.docker.com/r/totosan/iot_dev/) [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/totosan/iot_dev/blob/master/LICENSE)

Run the [PlatformIO](http://platformio.org) command-line builder in a docker container. This image will take it from there and turn your PlatformIO project into a binary which you then can [flash to the ESP8266](http://nodemcu.readthedocs.org/en/dev/en/flash/).

## Target audience

- IoT application developers

  They just need a ready-made firmware.

- Occasional firmware hackers

  They don't need full control over the complete tool chain and don't want to setup a Linux VM with the build environment.

**This image has been created for purposes of the THiNX IoT management platform.**


## Usage

### Install Docker
Follow the instructions at [https://docs.docker.com/get-started/](https://docs.docker.com/get-started/).

### Run this image with Docker
Start terminal and change to the your PlatformIO project directory. Then run:

``docker run --rm -ti -v `pwd`:/opt/workspace totosan/iot_dev``

Depending on the performance of your system it takes 1-3min until the compilation finishes. The first time you run this it takes longer because Docker needs to download the image and create a container.

:bangbang: If you have previously pulled this Docker image (e.g. with the command above) you should update the image from time to time to pull in the latest bug fixes:

`docker pull totosan/iot_dev`

**Note for Windows users**

(Docker on) Windows handles paths slightly differently. The command thus becomes (`c` equals C drive i.e. `c:`):

`docker run --rm -it -v //c/Users/<user>/<workspace>:/opt/platformio-builder totosan/iot_dev`

If the Windows path contains spaces it would have to be wrapped in quotes as usual on Windows.

`docker run --rm -it -v "//c/Users/monster tune/<workspace>":/opt/workspace totosan/iot_dev``

#### Output
The firmware file is created in the `bin` sub folder of your root directory. You will also find a mapfile in the `bin` folder with the same name as the firmware file but with a `.map` ending.

#### Options
You can pass the following optional parameters to the Docker build like so `docker run -e "<parameter>=value" -e ...`.

- `WORKDIR` Just an parametrization example, will deprecate or be used for additional libraries.

### Flashing the built binary
There are several [tools to flash the firmware](http://nodemcu.readthedocs.org/en/dev/en/flash/) to the ESP8266. If you were to use [esptool](https://github.com/themadinventor/esptool) (like I do) you'd run:

`esptool.py --port <USB-port-with-ESP8266> write_flash 0x00000 <workspace>/bin/firmware.bin`

## Pre-cached platforms

You may edit Dockerfile in order to pre-build image with your preferred platform. Initially, this image is configured to kick-start builds for ESP8266 and ESP32.

## Support
Don't leave comments on Docker Hub that are intended to be support requests. First, Docker Hub doesn't notify me when you write them, second I can't properly reply and third even if I could often it doesn't make much sense to keep them around forever and a day. Instead ask a question on [StackOverflow](http://stackoverflow.com/) and assign the `platformio` and `docker` tags.

For bugs and improvement suggestions create an issue at [https://github.com/totosan/iot_dev/issues](https://github.com/totosan/iot_dev/issues).

## Credits
This is a forked docker build from [GitHub: Matěj Sychra @ THiNX](https://github.com/suculent/platformio-docker-build)
Thanks to [Marcel Stoer](http://pfalcon-oe.blogspot.com/) who inspired me with his NodeMCU firmware builder on [http://frightanic.com](http://frightanic.com)

## Author
[Thomas Tomow](www.tomow.de)  
[GitHub Repo](https://github.com/totosan/platformio-docker-build) on the base of [Matěj Sychra @ THiNX](http://thinx.cloud)
