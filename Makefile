.PHONY: init
init:
	@echo "Installing dependencies"
	brew install podman helmfile kind kubectl helm jq yq openlens
	brew install --cask podman-desktop
	podman machine init || echo "Already initilized"
	podman machine stop || echo "Already stopped"
	podman machine set --rootful
	podman machine start || echo "Already started"
	helm plugin install https://github.com/databus23/helm-diff || echo "Plugin already exists"
	brew install arttor/tap/helmify

.PHONY: cluster
cluster:
	@echo "Starting podman and creating KinD cluster"
	podman machine start || echo "Podman already started, continuing."
	kind create cluster --wait 30s --config ./cluster.yaml

.PHONY: start
start:
	podman machine start || echo "Already started"

.PHONY: stop
stop:
	podman machine stop || echo "Already stopped"

.PHONY: clean
clean:
	kind delete cluster --name local-kube
	podman machine stop

.PHONY: apply
apply:
	helmfile apply

.PHONY: install
install:
	helmfile init --force
	helmfile sync

.PHONY: package
package:
	mkdir -p charts
	for dir in $(ls -1 -d manifests/* | sed 's/manifests\///g'); do helmify -f manifests/${dir} -r charts/${dir}; done
