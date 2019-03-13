# Docker image tag: $PKGNAME:$PKGVERSION
PKGNAME?=3d-blender-hylang
PKGVERSION?=latest

.PHONY: image
image: Dockerfile install.sh   # Build the docker image
	@docker build \
	        -t $(PKGNAME):$(PKGVERSION) \
	        -f ./Dockerfile \
	        $(CWDIR)
