# Trivy - scanner 

## Base image alpine linux

```sh
docker build -f Dockerfile.alpine -t owenwilson/trivy-scanner:latest .
```

## Base image ubuntu:22.04

```sh
docker build -t owenwilson/trivy-scanner:latest .
```

## Base image archlinux:latest

```sh
docker build -f Dockerfile.arch -t owenwilson/trivy-scanner:latest .
```

## Run Trivy-scanner

```sh
docker run --rm --name trivy-scanner -v /var/run/docker.sock:/var/run/docker.sock -p 9898:8000 -d owenwilson/trivy-scanner:latest
```
- trivy.yml file

```sh
docker-compose -f trivy.yml up -d
```

## Report with template html

```sh
docker exec -it trivy-scanner trivy image --severity HIGH,CRITICAL --format template --template "@html.tpl" -o report.html ubuntu:22.04
```

```sh
docker cp trivy-scanner:/var/www/report.html ./
```
## DevOps

- [Trivy tool](https://trivy.dev/)
