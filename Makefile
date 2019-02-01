.PHONY: all
all:

MAJOR_VERSION := 2.12
MINOR_VERSION := 2.12.0
ORG := syscomiddleware

.PHONY: build-zipkin-ui
build-zipkin-ui:
	docker build -t ${ORG}/zipkin-ui:${MAJOR_VERSION} ./zipkin-ui/

.PHONY: push-zipkin-ui
push-zipkin-ui: build-zipkin-ui
	docker push ${ORG}/zipkin-ui:${MAJOR_VERSION}
	docker tag ${ORG}/zipkin-ui:${MAJOR_VERSION} ${ORG}/zipkin-ui:${MINOR_VERSION}
	docker push ${ORG}/zipkin-ui:${MINOR_VERSION}
