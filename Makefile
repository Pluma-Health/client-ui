.PHONY: install build helm-template-all

build:
	docker build -t client-ui .


install:
	cd app && npm install




helm-template-all:
	@for profile in $$(ls deployment/profiles/); do \
		mkdir -p manifests/$$profile; \
		helm template client-ui deployment/ \
			-f deployment/profiles/$$profile/values.yaml \
			--output-dir manifests/$$profile; \
	done