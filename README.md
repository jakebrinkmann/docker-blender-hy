# 3d-blender-hylang
> Everything you can imagine is real.

Control Blender using Hy!

#### Contents

* [About](#about-)
* [Dependencies](#dependencies-)
* [Usage](#usage-)
* [Development](#development-)
* [Contributing](#contributing-)
* [Meta](#meta-)

## About [&#x219F;](#contents)

This is a playground for interactive/near-real-time development of a Blender 3d Scene using the Hy programming language (a Clojure-like LISP) which compiles to Python bytecode and can hook into Blender (a python library).

## Dependencies [&#x219F;](#contents)

The only system dependency, which can manage all other dependencies:

* [Docker](https://docs.docker.com/install/)

These requirements are pre-installed inside the Docker image: 

* [python](https://www.python.org/downloads/)
* [hylang](http://docs.hylang.org/en/stable/quickstart.html)
* [blender](https://docs.blender.org/manual/en/dev/)

## Usage [&#x219F;](#contents)

To run the pre-built environment, hosted on Dockerhub:

```console
# Run the image, connected to X-server
$ docker run -it --rm \
	-e DISPLAY=DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v ${PWD}:/opt/blender-hy:ro \
	jbrinkmann/blender-hy \
	blender
```

## Development  [&#x219F;](#contents)

To build the docker image locally: 

```console
# Build the docker image using make:
$ make image
...

# Or, build directly:
$ cd 3d-blender-hylang
$ docker build -t blender-hy .
...
```

## Contributing  [&#x219F;](#contents)

No contribution is too small!

## Meta [&#x219F;](#contents)

Jake Brinkmann – [@jakebrinkmann](https://twitter.com/jakebrinkmann) – jakebrinkmann@gmail.com

Distributed under the MIT license. See ``LICENSE.txt`` for more information.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Conventional Commit Messages](https://www.conventionalcommits.org/en/v1.0.0-beta.2/#summary).

[https://github.com/jakebrinkmann/3d-blender-hylang](https://github.com/jakebrinkmann/3d-blender-hylang)

---
---

[&#x219F; Back to Top &#x219F;](#readme)