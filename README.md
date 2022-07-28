# SVG conversion for books published with Fatpub

**WARNING: The dockerimage and action are currently only working with Inkscape not with Drawio**

Building the docker image:

```fish
docker build -t fatpub-svg-convert .
```

Running the docker image:

```fish
docker run -it --rm --volume (pwd):/data fatpub-svg-convert manuscript/images tmp/images png 300
```
