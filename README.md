<p align="center">
<a href="https://hub.docker.com/r/axelburks/snell">
<img src="https://user-images.githubusercontent.com/2666735/52914184-588a8380-3300-11e9-8f29-d6d3adc9bd05.png" />
</a>
</p>

<h1 align="center">snell</h1>

<p align="center">an encrypted proxy service program.</p>

<p align=center>
<a href="https://hub.docker.com/r/axelburks/snell">Docker Hub</a> ·
<a href="https://github.com/surge-networks/snell">Project Source</a> ·
</p>
***

## latest version

|version|
|---|
|axelburks/snell:latest|
|axelburks/snell:current|
|axelburks/snell:1.1.1|


## environment variables

|name|value|
|---|---|
|PORT|8388|
|**PSK**|[RANDOM]|
|**OBFS**|tls|
|ARGS|-|

***

### Build the image
```bash
$ cd docker-snell
$ docker build -t axelburks/snell:latest -t axelburks/snell:v4.1.1 .
$ cd arm
$ docker buildx build --platform linux/arm/v7 -t axelburks/snell:armv7l -t axelburks/snell:armv7l-v4.1.1 .
```

### Pull&Push the image

```bash
$ docker pull axelburks/snell

$ docker push axelburks/snell:latest
$ docker push axelburks/snell:v4.1.1

$ docker push axelburks/snell:armv7l
$ docker push axelburks/snell:armv7l-v4.1.1
```

### Start a container

```bash
$ docker run -d --name=snell -v $HOME/app/snell:/etc/snell --restart always -p 8388:8388 -p 8388:8388/udp axelburks/snell
```

### Display config

```bash
$ docker logs snell

[snell-server]
listen = 0.0.0.0:8388
psk = 05d80656cd67e1bec62d3366c13e6f11
obfs = http
2019-02-17 14:11:06.265334 [server_main] <NOTIFY> snell-server v1.1.1 (Mar  5 2019 13:50:05)
2019-02-17 14:11:06.265477 [server_main] <NOTIFY> Start snell server on 0.0.0.0:8388
2019-02-17 14:11:06.265484 [server_main] <NOTIFY> Obfs enabled (HTTP)
2019-02-17 14:11:06.265546 [server_main] <NOTIFY> TCP Fast Open enabled
```

Add a proxy line in Surge

`Proxy = snell, [SERVER ADDRESS], 8388, psk=05d80656cd67e1bec62d3366c13e6f11, version=2, test-url=http://wifi.vivo.com.cn/generate_204`
