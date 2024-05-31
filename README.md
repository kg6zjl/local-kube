# Local Kube-in-Docker (KIND) Config

### Build Your Development Environment
```
make init
make cluster
make install
```

### Manifest -> Helm Package
A neat little tool called `helmify` handles this. Place your raw manifests in `manifests/dir_name`.
```
# package up manifest into a helm chart in charts/
make package

# add a block to helmfile, sample:
# - name: sample_chart
#   namespace: sample-app
#   chart: charts/sample_chart

# deploy the chart
make install
```

### Cleanup Cluster and Deployments
Handy for rebuilding or freeing up resources.
```
make clean
```