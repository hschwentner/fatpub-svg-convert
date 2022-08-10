# SVG conversion for books published with Fatpub

**WARNING: The Docker image and GitHub action are currently only working with Inkscape not with Drawio**

Building the docker image:

```fish
docker build --platform amd64 -t fatpub-svg-convert .
```

Running the docker image:

```fish
docker run -it --rm --volume (pwd):/data fatpub-svg-convert manuscript/images tmp/images png 300
```
