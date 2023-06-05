metadata {
  name = "prefect"
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
  path = "helm/prefect"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "fc04fd61bcf327c9e90982a4263db722cf833cbec7b2809a87c0506824151821"
    retries = 0
    verbose = false
  }
}
