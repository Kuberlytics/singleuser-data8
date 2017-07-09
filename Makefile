VERSION=$(shell git rev-parse --short HEAD)
IMAGE=gcr.io/kuberlytics/deeplearning

release: VERSION=$(shell  git tag -l --points-at HEAD)

build:
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest

push:
	gcloud docker -- push $(IMAGE):$(VERSION)
	gcloud container images add-tag $(IMAGE):$(VERSION) $(IMAGE):latest  --quiet

release: build push
