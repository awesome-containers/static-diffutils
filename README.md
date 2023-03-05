# Statically linked Diffutils

Provided tools:

* `diff`
* `diff3`
* `sdiff`
* `cmp`

Statically linked [Diffutils] container image with [Bash]

> 2,2M (1,1M bash)

```bash
ghcr.io/awesome-containers/static-diffutils:latest
ghcr.io/awesome-containers/static-diffutils:3.9

docker.io/awesomecontainers/static-diffutils:latest
docker.io/awesomecontainers/static-diffutils:3.9
```

Slim statically linked [Diffutils] container image with [Bash] stripped and
packaged with [UPX]

> 1,4M (578K bash)

```bash
ghcr.io/awesome-containers/static-diffutils:latest-slim
ghcr.io/awesome-containers/static-diffutils:3.9-slim

docker.io/awesomecontainers/static-diffutils:latest-slim
docker.io/awesomecontainers/static-diffutils:3.9-slim
```

[Diffutils]: https://www.gnu.org/software/diffutils/
[Bash]: https://github.com/awesome-containers/static-bash
[UPX]: https://upx.github.io/

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" .
podman build -t "$image:latest-slim" -f Containerfile-slim \
  --build-arg STATIC_DIFFUTILS_IMAGE="$image" \
  --build-arg STATIC_DIFFUTILS_VERSION=latest --no-cache .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
