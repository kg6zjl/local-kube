# Local Kube-in-Docker (KIND) Config

### Build Your Development Environment
```
task init
```

### Run The Local Cluster
```
task up
# or 
task cluster
task package
task install
```

### Manifest -> Helm Package
A neat little tool called `helmify` handles this. Place your raw manifests in `manifests/dir_name`.
```
# package up manifest into a helm chart in charts/
task package

# add a block to helmfile, sample:
# - name: sample_chart
#   namespace: sample-app
#   chart: charts/sample_chart

# deploy the chart
task install
```

### Cleanup Cluster and Deployments
Handy for rebuilding or freeing up resources.
```
task clean
```