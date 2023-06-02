metadata {
  name = "ingress-nginx"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/ingress-nginx"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "ca6faa12256941340eb15fd4d600e389faea6da659f79e9ada1aa2a9c820e73e"
    retries = 0
    verbose = false
  }
}
