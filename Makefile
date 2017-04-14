VERSION=$(shell git rev-parse --short HEAD)
IMAGE=berkeleydsep/singleuser-data8

release: VERSION=$(shell  git tag -l --points-at HEAD)

build:
	s2i build . jupyterhub/singleuser-builder:v0.1 $(IMAGE):$(VERSION)

push:
	docker push $(IMAGE):$(VERSION)

release: build push
